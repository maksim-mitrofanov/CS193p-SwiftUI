//
//  EmojiGameViewModel.swift
//  Memorize
//
//  Created by Максим Митрофанов on 07.05.2023.
//

import Foundation

class EmojiMemoryGame: ObservableObject {
    @Published private var gameModel: MemoryGame<String> = EmojiMemoryGame.getGame()
    
    var cards: [MemoryGame<String>.Card] {
        gameModel.cards
    }
    
    //MARK: - UserIntents
    func choose(card: MemoryGame<String>.Card) {
        gameModel.choose(card)
    }
}

extension EmojiMemoryGame {
    static let emojis = ["🐶", "🐱", "🐭", "🐹", "🐰", "🦊", "🐻", "🐼", "🐻‍❄️", "🐨", "🐯", "🦁", "🐮", "🐷", "🐸", "🐵"].shuffled()
    
    static func getContent(forIndex index: Int) -> String {
        if emojis.indices.contains(index) { return emojis[index] }
        else { return "❌" }
    }
    
    static func getGame() -> MemoryGame<String> {
        MemoryGame(
            numberOfPairsOfCards: 5,
            createContent: EmojiMemoryGame.getContent(forIndex:)
        )
    }
}
