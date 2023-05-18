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
            let cornerRadius = calculateCornerRadius(for: geometry)
            
            ZStack {
                if card.isFaceUp {
                    RoundedRectangle(cornerRadius: cornerRadius)
                        .foregroundColor(.white)
                    
                    RoundedRectangle(cornerRadius: cornerRadius)
                        .strokeBorder(lineWidth: borderWidth)
                    
                    ZStack {
                        Circle()
                            .scale(backgroundCircleScale)
                        Text(card.content)
                    }
                    .font(font(for: geometry))
                }

                else {
                    RoundedRectangle(cornerRadius: cornerRadius)
                }
            }
            .foregroundColor(fillColor)
        }
    }
    
    private func calculateCornerRadius(for proxy: GeometryProxy) ->  CGFloat {
        proxy.size.height / cornerRadiusOffset
   }
    
    private func font(for geometry: GeometryProxy) -> Font {
        return Font.system(size: geometry.size.width / fontOffset)
    }
}
