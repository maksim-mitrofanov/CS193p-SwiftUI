//
//  CardView.swift
//  Memorize
//
//  Created by Максим Митрофанов on 15.05.2023.
//

import SwiftUI

struct CardView: View {
    
    var card: EmojiMemoryGame.Card
    
    //Params
    var borderWidth: CGFloat = 4
    var fillColor: Color = .orange
    var cornerRadiusOffset: CGFloat = 11
    var fontOffset: CGFloat = 2
    
    //Constants
    private let backgroundCircleScale: CGFloat = 0.85
    
    var body: some View {
        GeometryReader { geometry in
            let cardShape = createCardShape(for: geometry)
            
            ZStack {
                if card.isFaceUp {
                    cardShape.foregroundColor(.white)
                    cardShape.strokeBorder(lineWidth: borderWidth)
                    cardContents.font(font(for: geometry))
                }

                else { cardShape }
            }
            .foregroundColor(fillColor)
        }
    }
    
    var cardContents: some View {
        ZStack {
            PieShape(
                startAngle: Angle(degrees: 0 - 90),
                endAngle: Angle(degrees: 50 - 90))
                .scale(backgroundCircleScale)
                .opacity(0.55)
            Text(card.content)
        }
    }
    
    private func createCardShape(for proxy: GeometryProxy) -> RoundedRectangle {
        RoundedRectangle(cornerRadius: calculateCornerRadius(for: proxy))
    }
        
    private func calculateCornerRadius(for proxy: GeometryProxy) ->  CGFloat {
        proxy.size.height / cornerRadiusOffset
   }
    
    private func font(for geometry: GeometryProxy) -> Font {
        return Font.system(size: geometry.size.width / fontOffset)
    }
}
