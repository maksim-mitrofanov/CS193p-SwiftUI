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
    let aspectRatio: CGFloat = 2/3
    
    var body: some View {
        GeometryReader { geometry in
            ZStack {
                // Face Up
                if card.isFaceUp {
                    RoundedRectangle(cornerRadius: geometry.size.height / 10)
                        .foregroundColor(.white)
                    
                    RoundedRectangle(cornerRadius: geometry.size.height / 10)
                        .strokeBorder(lineWidth: borderWidth)
                        .foregroundColor(fillColor)
                    
                    Text(card.content)
                        .font(font(for: geometry))
                }
                // Face Down
                else {
                    RoundedRectangle(cornerRadius: geometry.size.height / 10)
                        .foregroundColor(fillColor)
                }
            }
        }
        .aspectRatio(aspectRatio, contentMode: .fit)
    }
    
    private func font(for geometry: GeometryProxy) -> Font {
        return Font.system(size: geometry.size.width / 2)
    }
}
