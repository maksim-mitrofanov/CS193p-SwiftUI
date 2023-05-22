//
//  Cardify.swift
//  Memorize
//
//  Created by Максим Митрофанов on 22.05.2023.
//

import SwiftUI

struct Cardify: ViewModifier {
    
    //Params
    var isFaceUp: Bool
    
    var borderWidth: CGFloat = 3
    var fillColor: Color = .orange
    var cornerRadiusOffset: CGFloat = 11
    var fontOffset: CGFloat = 2
    
    func body(content: Content) -> some View {
        GeometryReader { geometry in
            let cardShape = createCardShape(for: geometry)
            
            ZStack {
                if isFaceUp {
                    cardShape.foregroundColor(.white)
                    cardShape.strokeBorder(lineWidth: borderWidth)
                    content
                        .transition(AnyTransition.scale.animation(.easeInOut(duration: 0.25)))
                }

                else {
                    cardShape
                        .transition(AnyTransition.scale)
                }
            }
            .foregroundColor(fillColor)
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
