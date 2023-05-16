//
//  EmojiGameViewModel.swift
//  Memorize
//
//  Created by Максим Митрофанов on 07.05.2023.
//

import Foundation

class EmojiMemoryGame: ObservableObject {
    @Published private var gameModel = EmojiMemoryGame.getGame(with: selectedTheme)
    typealias Card = MemoryGame<String>.Card
    
    var cards: [Card] { gameModel.cards }
    var theme: GameTheme { EmojiMemoryGame.selectedTheme }
    var score: Int { gameModel.score }
    static var selectedTheme = GameTheme.allThemes.randomElement()!
    
    //MARK: - UserIntents
    func choose(card: Card) {
        gameModel.choose(card)
    }
    
    func startNewGame() {
        let randomTheme = GameTheme.allThemes.randomElement()!
        EmojiMemoryGame.selectedTheme = GameTheme(name: randomTheme.name, emojis: randomTheme.emojis.shuffled(), numberOfPairsOfCards: randomTheme.numberOfPairsOfCards, color: randomTheme.color)
        gameModel = EmojiMemoryGame.getGame(with: EmojiMemoryGame.selectedTheme)
    }
}









extension EmojiMemoryGame {
    private static func getContent(forIndex index: Int) -> String {        
        if selectedTheme.emojis.indices.contains(index) {
            return selectedTheme.emojis[index]
        }
        else { return "❌" }
        
    }
    
    private static func getGame(with theme: GameTheme) -> MemoryGame<String> {
        MemoryGame(
            numberOfPairsOfCards: theme.numberOfPairsOfCards,
            createContent: EmojiMemoryGame.getContent(forIndex:)
        )
    }
}
