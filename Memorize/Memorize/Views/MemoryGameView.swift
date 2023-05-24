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
            CardView(card: card,fillColor: .orange)
                .onTapGesture {
                    withAnimation(.easeInOut(duration: 3)) {
                        emojiGame.choose(card: card)
                    }
                }
                .opacity(card.isMatched ? 0.3 : 1)
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

struct MemoryGameView_Previews: PreviewProvider {
    static let game = EmojiMemoryGame(cardCount: 26)
    
    static var previews: some View {
        game.choose(card: game.cards[0])
        return MemoryGameView(emojiGame: game)
    }
}
