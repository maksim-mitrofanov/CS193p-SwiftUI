//
//  SetGameView.swift
//  SET Game
//
//  Created by Максим Митрофанов on 19.05.2023.
//

import SwiftUI

struct SetGameView: View {
    let game = SetGameModel(deals: 7)
    
    var body: some View {
        ZStack {
            Color.red.opacity(0.9)
                .edgesIgnoringSafeArea(.all)
            
            AspectVGrid(items: game.displayedCards, aspectRatio: 2/3) { cardData in
                SetCardView(model: cardData)
            }
            .padding(.horizontal)
        }
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        SetGameView()
    }
}
