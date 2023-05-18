//
//  MemoryGameView.swift
//  Memorize
//
//  Created by Максим Митрофанов on 05.05.2023.
//

import SwiftUI

struct MemoryGameView: View {
    @ObservedObject var emojiGame: EmojiMemoryGame
    private let columns = [GridItem(.adaptive(minimum: 80))]
    
    var body: some View {
        VStack {
            title
            cards
            Spacer()
        }
    }
    
    var title: some View {
        Text("Memorize!")
            .font(.system(size: 30, design: .serif))
            .padding(.top)
    }
    
    var cards: some View {
        ScrollView {
            LazyVGrid(columns: columns, spacing: 10){
                ForEach(emojiGame.cards) { card in
                    CardView(card: card, fillColor: .orange)
                        .onTapGesture {
                            emojiGame.choose(card: card)
                        }
                        .opacity(card.isMatched ? 0.3 : 1)
                }
            }
            .padding()
        }
    }
}

struct MemoryGameView_Previews: PreviewProvider {
    
    static var previews: some View {
        MemoryGameView(emojiGame: EmojiMemoryGame())
    }
}
