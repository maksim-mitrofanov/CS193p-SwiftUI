//
//  SetGameViewModel.swift
//  SET Game
//
//  Created by Максим Митрофанов on 19.05.2023.
//

import Foundation

class SetGameViewModel: ObservableObject {
    @Published private var game = SetGameModel()
    
    //User Intentions
    func startNewGame() {
        game = SetGameModel()
    }
    
    func shuffleCards() {
        //
    }
    
    func dealMoreCards() {
        game.addMoreCards()
    }
    
    var displayedCards: [SetCardModel] {
        game.displayedCards
    }
}
