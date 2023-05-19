//
//  SetCardView.swift
//  SET Game
//
//  Created by Максим Митрофанов on 19.05.2023.
//

import SwiftUI

struct SetCardView: View {
    let model: SetCardModel
    
    var body: some View {
        SetGameThemeModel.getAttributedTitle(for: model).asText()
    }
}

struct SetCardView_Previews: PreviewProvider {
    static var previews: some View {
        let game = SetGameModel(demo: true)
        let gameCards = game.displayedCards
        
        VStack {
            Text(gameCards.count.description)
            
            ForEach(gameCards) { card in
                SetCardView(model: card)
            }
        }
    }
}
