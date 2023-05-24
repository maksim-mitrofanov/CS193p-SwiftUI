//
//  Cardify.swift
//  Memorize
//
//  Created by Максим Митрофанов on 22.05.2023.
//

import SwiftUI

struct Cardify: Animatable, ViewModifier {
    
    init(isFaceUp: Bool) {
        rotation = isFaceUp ? 0 : 180
    }
    
    var rotation: Double // how much the card is rotated
    
    var animatableData: Double {
        get { rotation }
        set { rotation = newValue }
    }
    
    func body(content: Content) -> some View {
        GeometryReader { geometry in
            let cardShape = createCardShape(for: geometry)
            
            ZStack {
                if shouldDisplayFaceUp {
                    cardShape.foregroundColor(.white)
                    cardShape.strokeBorder(lineWidth: borderWidth)
                }
                else {
                    cardShape
                }
                
                content
                    .opacity(shouldDisplayFaceUp ? 1 : 0)
            }
            .animation(.none)
            .foregroundColor(fillColor)
            .rotation3DEffect(Angle(degrees: rotation), axis: (x: 0, y: 1, z: 0))
        }
    }
    
    private func createCardShape(for proxy: GeometryProxy) -> RoundedRectangle {
        RoundedRectangle(cornerRadius: calculateCornerRadius(for: proxy))
    }
        
    private func calculateCornerRadius(for proxy: GeometryProxy) ->  CGFloat {
        proxy.size.height / cornerRadiusOffset
   }
}

extension View {
    func cardify(isFaceUp: Bool) -> some View {
        self.modifier(Cardify(isFaceUp: isFaceUp))
    }
}

extension Cardify {
    var borderWidth: CGFloat { 3 }
    var fillColor: Color { .orange }
    var cornerRadiusOffset: CGFloat { 11 }
    var fontOffset: CGFloat { 2 }
    
    var shouldDisplayFaceUp: Bool { rotation < 90 }
}
