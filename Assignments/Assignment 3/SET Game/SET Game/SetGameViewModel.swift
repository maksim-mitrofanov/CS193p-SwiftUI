//
//  SetGameViewModel.swift
//  SET Game
//
//  Created by Максим Митрофанов on 19.05.2023.
//

import Foundation

class SetGameViewModel: ObservableObject {
    @Published private var game = SetGameModel()
    
    //UI Parameters
    var displayedCards: [SetCardModel] {
        game.displayedCards
    }
    
    var canDealMoreCards: Bool {
        game.canDealMoreCards
    }
    
    var status: String {
        game.status
    }
    
    var score: String {
        game.score.description
    }
    
    func isCardSelected(card: SetCardModel) -> Bool {
        let selectedIndices = game.selectedCardIndices
        if let cardIndex = displayedCards.firstIndex(of: card) {
            return selectedIndices.contains(cardIndex)
        }
        return false
    }
    
    //User Intentions
    func startNewGame() {
        game = SetGameModel()
    }

    func dealMoreCards() {
        game.addMoreCards()
    }
    
    func selectCard(with id: String) {
        if let cardIndex = displayedCards.firstIndex(where: { $0.id == id }) {
            game.selectCard(at: cardIndex)
        }
        
        if game.shouldReplaceSelectedCards {
            DispatchQueue.main.asyncAfter(deadline: .now() + 1) { [weak self] in
                self?.game.replaceSelectedCards()
            }
        }
    }
}
