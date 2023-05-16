//
//  GameTheme.swift
//  Memorize
//
//  Created by Максим Митрофанов on 16.05.2023.
//

import Foundation
import SwiftUI

struct GameTheme {
    let name: String
    let emojis: [String]
    let numberOfPairsOfCards: Int
    let color: Color
}

extension GameTheme {
    static let animals = GameTheme(
        name: "Animals",
        emojis: ["🐶","🐱","🐭","🐹","🐰","🦊","🐻","🐼","🐻‍❄️","🐨","🐯","🦁","🐮","🐷"],
        numberOfPairsOfCards: 7,
        color: .green
    )
    
    static let seaCreatures = GameTheme(
        name: "Sea Creatures",
        emojis: ["🐙", "🦑", "🦐", "🦞", "🦀", "🐡", "🐠", "🐟", "🐬", "🐳", "🐋", "🦈", "🦭", "🐊"],
        numberOfPairsOfCards: 8,
        color: .blue
    )
    
    static let fruits = GameTheme(
        name: "Fruits",
        emojis: ["🍏", "🍎", "🍐", "🍊", "🍋", "🍌", "🍉", "🍇", "🍓", "🫐", "🍈", "🍒", "🍑", "🥭", "🍍", "🥥", "🥝"],
        numberOfPairsOfCards: 9,
        color: .orange
    )
    
    static let flags = GameTheme(
        name: "Flags",
        emojis: ["🏴‍☠️", "🏁", "🇺🇳", "🇦🇽", "🇦🇫", "🇮🇴", "🇦🇸", "🇧🇹", "🇻🇮", "🏴󠁧󠁢󠁷󠁬󠁳󠁿", "🇬🇱", "🇨🇲", "🇰🇭", "🇨🇬", "🇨🇷", "🇨🇮", "🇲🇬", "🇲🇷", "🇲🇶", "🇳🇵", "🇲🇸", "🇲🇳", "🇵🇾", "🇷🇪", "🇵🇬","🇰🇷", "🇱🇨", "🇼🇫", "🇱🇰", "🇸🇿"],
        numberOfPairsOfCards: 20,
        color: .purple
    )
    
    static let allThemes = [animals, seaCreatures, fruits, flags]
}
