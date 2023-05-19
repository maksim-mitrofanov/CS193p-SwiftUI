//
//  SetGameView.swift
//  SET Game
//
//  Created by Максим Митрофанов on 19.05.2023.
//

import SwiftUI

struct SetGameView: View {
    @ObservedObject var game = SetGameViewModel()
    
    var body: some View {
        ZStack {
            Color.red.opacity(0.9)
                .edgesIgnoringSafeArea(.all)
            
            VStack {
                AspectVGrid(items: game.displayedCards, aspectRatio: 2/3) { cardData in
                    SetCardView(model: cardData)
                }
                Button {
                    game.dealMoreCards()
                } label: {
                    Text("Deal more cards")
                        .font(.title2)
                }
                .buttonStyle(.borderedProminent)
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
