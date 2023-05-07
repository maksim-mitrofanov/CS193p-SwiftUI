//
//  EmojiGameViewModel.swift
//  Memorize
//
//  Created by Максим Митрофанов on 07.05.2023.
//

import Foundation

class EmojiGame {
    private var gameModel: MemoryGame<String>
    
    init(numberOfPairsOfCards: Int) {
        gameModel = MemoryGame(
            numberOfPairsOfCards: numberOfPairsOfCards,
            createContent: EmojiGame.getContent(forIndex:)
        )
    }
}

extension EmojiGame {
    static let emojis = ["🐶", "🐱", "🐭", "🐹", "🐰", "🦊", "🐻", "🐼", "🐻‍❄️", "🐨", "🐯", "🦁", "🐮", "🐷", "🐸", "🐵"]
    
    static func getContent(forIndex index: Int) -> String {
        if emojis.indices.contains(index) { return emojis[index] }
        else { return "❌" }
    }
}
