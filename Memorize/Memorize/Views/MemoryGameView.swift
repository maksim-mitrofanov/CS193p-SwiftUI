//
//  MemoryGameView.swift
//  Memorize
//
//  Created by Максим Митрофанов on 05.05.2023.
//

import SwiftUI

struct MemoryGameView: View {
    @State var dealt = Set<Int>()
    @ObservedObject var emojiGame: EmojiMemoryGame
    
    var body: some View {
        VStack {
            title
            cards
            shuffleButton
        }
        .padding(.horizontal)
    }
    
    var title: some View {
        Text("Memorize!")
            .font(.system(size: 30, design: .serif))
            .padding(.top)
    }
    
    var cards: some View {
        AspectVGrid(items: emojiGame.cards, aspectRatio: 5/6.5) { card in
            if isUndealt(card: card) || card.isMatched && !card.isFaceUp {
                Color.clear
            }
            else {
                CardView(card: card,fillColor: .orange)
                    .transition(.scale)
                    .onTapGesture {
                        withAnimation  {
                            emojiGame.choose(card: card)
                        }
                    }
            }
        }
        .onAppear {
            // "deal" the cards
            withAnimation {
                emojiGame.cards.forEach { deal(card: $0) }
            }
        }
    }
    
    var shuffleButton: some View {
        Button {
            withAnimation {
                emojiGame.shuffle()
            }
        } label:  {
            Text("Shuffle")
                .font(.title2)
        }
        .buttonStyle(.bordered)
    }
}

extension MemoryGameView {
    // Computed Variables
    private var columns: [GridItem] { [GridItem(.adaptive(minimum: 80))] }
    
    // Functions
    private func deal(card: EmojiMemoryGame.Card) {
        dealt.insert(card.id)
    }
    
    private func isUndealt(card: EmojiMemoryGame.Card) -> Bool {
        !dealt.contains(card.id)
    }
}

struct MemoryGameView_Previews: PreviewProvider {
    static let game = EmojiMemoryGame(cardCount: 10)
    
    static var previews: some View {
        game.choose(card: game.cards[0])
        return MemoryGameView(emojiGame: game)
    }
}
