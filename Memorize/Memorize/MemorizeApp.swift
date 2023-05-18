//
//  MemorizeApp.swift
//  Memorize
//
//  Created by Максим Митрофанов on 05.05.2023.
//

import SwiftUI

@main
struct MemorizeApp: App {
    private let game = EmojiMemoryGame(cardCount: 14)
    
    var body: some Scene {
        WindowGroup {
            MemoryGameView(emojiGame: game)
        }
    }
}
