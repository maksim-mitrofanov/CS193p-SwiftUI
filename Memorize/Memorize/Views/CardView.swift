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
    
    var body: some View {
        GeometryReader { geometry in
            let cornerRadius = geometry.size.height / 11
            ZStack {
                // Face Up
                if card.isFaceUp {
                    RoundedRectangle(cornerRadius: cornerRadius)
                        .foregroundColor(.white)
                    
                    RoundedRectangle(cornerRadius: cornerRadius)
                        .strokeBorder(lineWidth: borderWidth)
                        .foregroundColor(fillColor)
                    
                    Text(card.content)
                        .font(font(for: geometry))
                }
                // Face Down
                else {
                    RoundedRectangle(cornerRadius: cornerRadius)
                        .foregroundColor(fillColor)
                }
            }
        }
    }
    
    private func font(for geometry: GeometryProxy) -> Font {
        return Font.system(size: geometry.size.width / 2)
    }
}
