//
//  MemoryGameView.swift
//  Memorize
//
//  Created by Максим Митрофанов on 05.05.2023.
//

import SwiftUI

struct MemoryGameView: View {
    @ObservedObject var emojiGame: EmojiMemoryGame
    let timer = Timer.publish(every: 0.1, on: .main, in: .common).autoconnect()

    @State private var dealtCardIDs = Set<Int>() {
        didSet {
            print("~~~~~~~~~~~~~~")
            print(dealtCardIDs.count)
        }
    }
    
    @State private var isDealingCards: Bool = false
    
    @Namespace private var dealingNameSpace
    
    var body: some View {
        VStack {
            title
            gameBody
            deckBody
                .padding(.bottom)
            
            HStack {
                shuffleButton
                Spacer()
                restart
            }
            .padding(.horizontal)
        }
        .padding(.horizontal)
    }
    
    var title: some View {
        Text("Memorize!")
            .font(.system(size: 30, design: .serif))
            .padding(.top)
    }
    
    var gameBody: some View {
        AspectVGrid(items: emojiGame.cards, aspectRatio: cardAspectRatio) { card in
            if isUndealt(card: card) || card.isMatched && !card.isFaceUp {
                Color.clear
            }
            else {
                CardView(card: card,fillColor: .orange)
                    .matchedGeometryEffect(id: card.id, in: dealingNameSpace)
                    .transition(.asymmetric(insertion: .identity, removal: .scale))
                    .transition(.scale)
                    .onTapGesture {
                        withAnimation  {
                            emojiGame.choose(card: card)
                        }
                    }
            }
        }
    }
    
    var deckBody: some View {
        ZStack {
            ForEach(emojiGame.cards.filter(isUndealt)) { card in
                let cardIndex = emojiGame.cardIndex(for: card)
                let cardOffset = cardOffset(cardIndex: cardIndex)
                
                CardView(card: card)
                    .matchedGeometryEffect(id: card.id, in: dealingNameSpace)
                    .transition(.asymmetric(insertion: .opacity, removal: .identity))
                    .zIndex(-Double(cardIndex))
                    .rotationEffect(cardRotationAngle(cardIndex: cardIndex))
                    .offset(x: cardOffset.x, y: cardOffset.y)
            }
        }
        .onTapGesture {
            // "deal" the cards
            withAnimation {
                emojiGame.deal()
            }
            
            isDealingCards = true
        }
        .onReceive(timer) { _ in
            if isDealingCards, let firstCard = emojiGame.cards.filter(isUndealt).first {
                withAnimation(Animation.easeInOut(duration: dealDuration)) {
                    deal(card: firstCard)
                }
            }
        }
        .frame(width: undealtCardWidth, height: undealtCardHeight)
    }
    
    var shuffleButton: some View {
        Button {
            withAnimation {
                emojiGame.shuffle()
            }
        } label:  {
            Text("Shuffle")
                .font(.title3)
        }
    }
    
    var restart: some View {
        Button {
            isDealingCards = false
            
            
            withAnimation {
                dealtCardIDs.removeAll()
            }
            
            withAnimation {
                emojiGame.restart()
            }
                        
        } label: {
            Text("Restart")
                .font(.title3)
        }
    }
}

extension MemoryGameView {
    // Computed Variables
    private var columns: [GridItem] { [GridItem(.adaptive(minimum: 80))] }
    private var cardAspectRatio: CGFloat { 5/6.5 }
    private var undealtCardHeight: CGFloat { 90 }
    private var undealtCardWidth: CGFloat { undealtCardHeight * cardAspectRatio }
    private var dealDuration: Double { 0.5 }
    private var totalDealDuration: Double { 2 }
    
    // Functions
    private func deal(card: EmojiMemoryGame.Card) {
        dealtCardIDs.insert(card.id)
    }
    
    private func isUndealt(card: EmojiMemoryGame.Card) -> Bool {
        !dealtCardIDs.contains(card.id)
    }
    
    private func cardRotationAngle(cardIndex: Int) -> Angle {
        switch cardIndex % 3 {
        case 1: return Angle(degrees: -10)
        case 2: return Angle(degrees: 10)
        default: return Angle(degrees: 0)
        }
    }
    
    private func cardOffset(cardIndex: Int) -> (x: CGFloat, y: CGFloat) {
        switch cardIndex % 3 {
        case 1: return (-20, 5)
        case 2: return (20, 5)
        default: return (0, 0)
        }
    }
}

struct MemoryGameView_Previews: PreviewProvider {
    static let game = EmojiMemoryGame(cardCount: 10)
    
    static var previews: some View {
        game.choose(card: game.cards[0])
        return MemoryGameView(emojiGame: game)
    }
}
