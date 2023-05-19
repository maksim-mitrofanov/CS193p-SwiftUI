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
            backgroundColor
            
            VStack {
                topTitles
                cardsGrid
                Spacer()
                statusLabel
                bottomButtons
            }
            .padding(.horizontal)
        }
    }
    
    var backgroundColor: some View {
        Color.red.opacity(0.9)
            .edgesIgnoringSafeArea(.all)
    }
    
    var cardsGrid: some View {
        AspectVGrid(items: game.displayedCards, aspectRatio: 2/3) { cardData in
            SetCardView(
                model: cardData,
                isSelected: game.isCardSelected(card: cardData)
            )
                .onTapGesture {
                    game.selectCard(with: cardData.id)
                }
        }
    }
    
    var topTitles: some View {
        VStack {
            Text("Memorize!!")
                .font(.system(.largeTitle, design: .serif, weight: .semibold))
                .foregroundColor(.white)
            HStack {
                Text("Card count: \(game.displayedCards.count)")
                Text("Score: \(game.score)")
            }
            .foregroundColor(.white)
        }
    }
    
    var statusLabel: some View {
        Text(game.status)
            .font(.title3)
            .padding(5)
            .background { Rectangle().fill(Color.white) }
            .cornerRadius(10)
            .opacity(game.status.isEmpty ? 0 : 1)
    }
    
    var bottomButtons: some View {
        HStack {
            //New Game
            Button {
                game.startNewGame()
            } label: {
                Text("New Game")
                    .font(.title2)
            }
            .buttonStyle(.borderedProminent)
            
            
            //Deal More Cards
            Button {
                game.dealMoreCards()
            } label: {
                Text("Deal more cards")
                    .font(.title2)
            }
            .buttonStyle(.borderedProminent)
            .disabled(!game.canDealMoreCards)
        }
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        SetGameView()
    }
}
