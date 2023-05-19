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
        SetGameThemeModel.getDisplayedShape(for: model)
            .aspectRatio(8/5, contentMode: .fit)
    }
}

struct SetCardView_Previews: PreviewProvider {
    static var previews: some View {
        let game = SetGameModel(demo: true)
        let gameCards = game.displayedCards
        
        ScrollView {
            Text(gameCards.count.description)
            
            ForEach(gameCards) { card in
                VStack {
                    SetCardView(model: card)
                        .frame(width: 100, height: 100)
                        .padding(.vertical, 5)
                    Divider()
                }
            }
        }
    }
}
