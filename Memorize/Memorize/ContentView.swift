//
//  ContentView.swift
//  Memorize
//
//  Created by Максим Митрофанов on 05.05.2023.
//

import SwiftUI

struct ContentView: View {
    @StateObject var viewModel: EmojiMemoryGame
    let columns = [GridItem(.adaptive(minimum: 80))]
    
    var body: some View {
        VStack {
            Text("Memorize!")
                .font(.system(size: 30, design: .serif))
                .padding(.top)
            ScrollView {
                LazyVGrid(columns: columns, spacing: 10){
                    ForEach(viewModel.cards) { card in
                        CardView(card: card, fillColor: .orange)
                            .onTapGesture {
                                viewModel.choose(card: card)
                            }
                            .opacity(card.isMatched ? 0.3 : 1)
                    }
                }
                .padding()
            }
            Spacer()
        }
    }
}

struct CardView: View {
    var card: MemoryGame<String>.Card
    
    //Params
    var cornerRadius: CGFloat = 16
    var borderWidth: CGFloat = 4
    var fillColor: Color = .orange
    let aspectRatio: CGFloat = 2/3
    
    var body: some View {
        ZStack {
            if card.isFaceUp { faceUpView }
            else { faceDownView }
        }
        .aspectRatio(aspectRatio, contentMode: .fit)
    }
    
    var faceUpView: some View {
        ZStack {
            RoundedRectangle(cornerRadius: cornerRadius)
                .foregroundColor(.white)
            
            RoundedRectangle(cornerRadius: cornerRadius)
                .strokeBorder(lineWidth: borderWidth)
                .foregroundColor(fillColor)
            
            Text(card.content)
                .font(.largeTitle)
        }
    }
    
    var faceDownView: some View {
        ZStack {
            RoundedRectangle(cornerRadius: cornerRadius)
                .foregroundColor(fillColor)
        }
    }
}

struct ContentView_Previews: PreviewProvider {
    
    static var previews: some View {
        ContentView(viewModel: EmojiMemoryGame())
    }
}
