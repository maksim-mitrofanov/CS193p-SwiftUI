//
//  EmojiGameViewModel.swift
//  Memorize
//
//  Created by Максим Митрофанов on 07.05.2023.
//

import Foundation

class EmojiMemoryGame: ObservableObject {
    @Published private var gameModel = EmojiMemoryGame.getGame()
    
    typealias Card = MemoryGame<String>.Card
    
    var cards: [Card] {
        gameModel.cards
    }
    
    //MARK: - UserIntents
    func choose(card: Card) {
        gameModel.choose(card)
    }
    
    func shuffle() {
        gameModel.shuffle()
    }
    
    func cardIndex(for card: EmojiMemoryGame.Card) -> Int {
        if let index = cards.firstIndex(where: { $0.id == card.id }) { return index }
        else { return 0 }
    }
    
    func restart() {
        gameModel = EmojiMemoryGame.getGame(with: Int(14 / 2))
        gameModel.resetGame()
    }
    
    func deal() {
        gameModel.startGame()
    }
    
    init(cardCount: Int = 6) {
        gameModel = EmojiMemoryGame.getGame(with: Int(cardCount / 2))
    }
}









extension EmojiMemoryGame {
    private static let emojis = ["🐶", "🐱", "🐭", "🐹", "🐰", "🦊", "🐻", "🐼", "🐻‍❄️", "🐨", "🐯", "🦁", "🐮", "🐷", "🐸", "🐵"].shuffled()
    
    private static func getContent(forIndex index: Int) -> String {
        if emojis.indices.contains(index) { return emojis[index] }
        else { return "❌" }
    }
    
    private static func getGame(with numberOfPairsOfCards: Int = 3) -> MemoryGame<String> {
        MemoryGame(
            numberOfPairsOfCards: numberOfPairsOfCards,
            createContent: EmojiMemoryGame.getContent(forIndex:)
        )
    }
}
