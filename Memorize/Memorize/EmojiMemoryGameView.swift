//
//  EmojiMemoryGameView.swift
//  Memorize
//
//  Created by Максим Митрофанов on 05.05.2023.
//

import SwiftUI

struct EmojiMemoryGameView: View {
    @ObservedObject var emojiGame: EmojiMemoryGame
    private var columns: [GridItem] {
        if emojiGame.theme.numberOfPairsOfCards > 18 {
            return [GridItem(.adaptive(minimum: 70))]
        } else {
            return [GridItem(.adaptive(minimum: 80))]
        }
    }
    
    var body: some View {
        VStack {
            topTitle
            cards
            bottomButtons
        }
    }
    
    var topTitle: some View {
        VStack {
            Text(emojiGame.theme.name)
                .font(.system(size: 30, design: .serif))
                .padding(.top)
            Text("Score: \(emojiGame.score)")
        }
    }
    
    var cards: some View {
        ScrollView {
            LazyVGrid(columns: columns, spacing: 10){
                ForEach(emojiGame.cards) { card in
                    CardView(card: card, fillColor: emojiGame.theme.color)
                        .onTapGesture {
                            emojiGame.choose(card: card)
                        }
                        .opacity(card.isMatched ? 0.3 : 1)
                }
            }
            .padding()
        }
        .scrollIndicators(.hidden)
    }
    
    var bottomButtons: some View {
        Button {
            emojiGame.startNewGame()
        } label: {
            Text("New Game")
                .font(.title2)
        }
        .buttonStyle(.borderedProminent)
    }
}

struct EmojiMemoryGameView_Previews: PreviewProvider {
    
    static var previews: some View {
        EmojiMemoryGameView(emojiGame: EmojiMemoryGame())
    }
}
