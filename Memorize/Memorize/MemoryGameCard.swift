//
//  MemoryGameCard.swift
//  Memorize
//
//  Created by Максим Митрофанов on 18.05.2023.
//

import Foundation

extension MemoryGame {
    struct Card: Identifiable {
        var isFaceUp = false
        var isMatched = false
        let content: CardContent
        let id: Int
    }
}
