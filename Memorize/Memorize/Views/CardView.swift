//
//  CardView.swift
//  Memorize
//
//  Created by Максим Митрофанов on 15.05.2023.
//

import SwiftUI

struct CardView: View {
    
    
    //Params
    var card: EmojiMemoryGame.Card
    var fillColor: Color = .orange
    var fontOffset: CGFloat = 1.6
    
    //Constants
    private let backgroundCircleScale: CGFloat = 0.85
    
    var body: some View {
        cardContents.cardify(isFaceUp: card.isFaceUp)
    }
    
    var cardContents: some View {
        GeometryReader { proxy in
        ZStack {
                PieShape(
                    startAngle: Angle(degrees: 0 - 90),
                    endAngle: Angle(degrees: 50 - 90))
                .scale(backgroundCircleScale)
                .opacity(0.55)
                Text(card.content)
                    .font(font(for: proxy))
            }
        }
    }
    
    private func font(for geometry: GeometryProxy) -> Font {
        return Font.system(size: geometry.size.width / fontOffset)
    }
}
