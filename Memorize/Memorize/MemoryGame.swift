//
//  MemoryGameModel.swift
//  Memorize
//
//  Created by Максим Митрофанов on 07.05.2023.
//

import Foundation

struct MemoryGame<CardContent> {
    private(set) var cards: [Card]
    
    func choose(_ card: Card) {
        //implement choose logic
    }
    
    struct Card {
        var isFaceUp = false
        var isMatched = false
        var content: CardContent
    }
    
    init(numberOfPairsOfCards: Int, createContent: (Int) -> CardContent) {
        cards = []
        
        for pairIndex in 0..<numberOfPairsOfCards {
            cards.append(Card(content: createContent(pairIndex)))
            cards.append(Card(content: createContent(pairIndex)))
        }
    }
}
