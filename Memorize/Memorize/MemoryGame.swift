//
//  MemoryGameModel.swift
//  Memorize
//
//  Created by Максим Митрофанов on 07.05.2023.
//

import Foundation

struct MemoryGame<CardContent: Equatable> {
    private(set) var cards: [Card]
    
    private var indexOfTheOnlyFaceUpCard: Int? {
        get { cards.indices.filter { cards[$0].isFaceUp }.oneAndOnly }
        set { cards.indices.forEach { cards[$0].isFaceUp = $0 == newValue }}
    }
    
    mutating func choose(_ card: Card) {
        guard let chosenCardIndex = cards.firstIndex(where: { $0.id == card.id }) else { return }
        guard !cards[chosenCardIndex].isFaceUp, !cards[chosenCardIndex].isMatched else { return }
        
        if let matchIndex = indexOfTheOnlyFaceUpCard {
            if cards[matchIndex].content == cards[chosenCardIndex].content {
                cards[matchIndex].isMatched = true
                cards[chosenCardIndex].isMatched = true
            }
            cards[chosenCardIndex].isFaceUp = true
        } else {
            indexOfTheOnlyFaceUpCard = chosenCardIndex
        }
    }
    
    init(numberOfPairsOfCards: Int, createContent: (Int) -> CardContent) {
        cards = MemoryGame.generateCards(numberOfPairs: numberOfPairsOfCards, createContent: createContent)
        cards.shuffle()
    }
}











extension MemoryGame {
    struct Card: Identifiable {
        var isFaceUp = false
        var isMatched = false
        let content: CardContent
        let id: Int
    }
}

extension MemoryGame {
    static func generateCards(numberOfPairs: Int, createContent: (Int) -> CardContent) -> [MemoryGame.Card] {
        var outputCards = [Card]()
        
        for pairIndex in 0..<numberOfPairs {
            outputCards.append(Card(content: createContent(pairIndex), id: pairIndex * 2))
            outputCards.append(Card(content: createContent(pairIndex), id: pairIndex * 2 + 1))
        }
        
        return outputCards
    }
}

extension Array {
    var oneAndOnly: Element? {
        self.count == 1 ? self[0] : nil
    }
}
