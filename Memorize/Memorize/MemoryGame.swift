//
//  MemoryGameModel.swift
//  Memorize
//
//  Created by Максим Митрофанов on 07.05.2023.
//

import Foundation

struct MemoryGame<CardContent: Equatable> {
    private(set) var cards: [Card]
    
    private var indexOfTheOnlyFaceUpCard: Int?
    
    mutating func choose(_ card: Card) {
        guard let chosenCardIndex = cards.firstIndex(where: { $0.id == card.id }) else { return }
        cards[chosenCardIndex].isFaceUp.toggle()
        
        //Has match
        if cards[chosenCardIndex].isFaceUp == true && !cards[chosenCardIndex].isMatched {
            if let faceUpCardIndex = indexOfTheOnlyFaceUpCard, cards[faceUpCardIndex].content == card.content {
                cards[chosenCardIndex].isMatched = true
                cards[faceUpCardIndex].isMatched = true
                indexOfTheOnlyFaceUpCard = nil
            }
        }
        
        //No Match
        cards.indices.forEach {
            cards[$0].isFaceUp = false
        }
        cards[chosenCardIndex].isFaceUp = true
        indexOfTheOnlyFaceUpCard = chosenCardIndex
        
        cards.indices.forEach {
            if cards[$0].isMatched { cards[$0].isFaceUp = true }
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
        var content: CardContent
        var id: Int
    }
}

extension MemoryGame {
    static func generateCards(numberOfPairs: Int, createContent: (Int) -> CardContent) -> [MemoryGame.Card] {
        var outputCards: [Card] = []
        
        for pairIndex in 0..<numberOfPairs {
            outputCards.append(Card(content: createContent(pairIndex), id: pairIndex * 2))
            outputCards.append(Card(content: createContent(pairIndex), id: pairIndex * 2 + 1))
        }
        
        return outputCards
    }
}
