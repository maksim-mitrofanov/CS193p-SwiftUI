//
//  ContentView.swift
//  Memorize
//
//  Created by Максим Митрофанов on 05.05.2023.
//

import SwiftUI

struct ContentView: View {
    let emojis = ["🐶", "🐱", "🐭", "🐹", "🐰", "🦊", "🐻", "🐼", "🐻‍❄️", "🐨", "🐯", "🦁", "🐮", "🐷", "🐸", "🐵"]
    let columns = [GridItem(.adaptive(minimum: 80))]
    @State var shownEmojiCount = 4
    
    var body: some View {
        VStack {
            Text("Memorize!")
                .font(.system(size: 30, design: .serif))
                .padding(.top)
            ScrollView {
                LazyVGrid(columns: columns, spacing: 10){
                    ForEach(emojis[0..<shownEmojiCount], id: \.self) { emoji in
                        CardView(title: emoji, fillColor: .orange)
                    }
                }
                .padding()
            }
            Spacer()
            bottomButtons
        }
    }
    
    var bottomButtons: some View {
        HStack {
            removeCardsButton
            addCardsButton
        }
        .buttonStyle(.bordered)
        .font(.title2)
        .padding()
    }
    
    var addCardsButton: some View {
        Button {
            if shownEmojiCount < emojis.count { shownEmojiCount += 1}
        } label: {
            Image(systemName: "plus.circle")
        }
    }
    
    var removeCardsButton: some View {
        Button {
            if shownEmojiCount > 2 { shownEmojiCount -= 1}
        } label: {
            Image(systemName: "minus.circle")
        }
    }
}

struct CardView: View {
    //Params
    let title: String
    var cornerRadius: CGFloat = 16
    var borderWidth: CGFloat = 4
    var fillColor: Color = .orange
    let aspectRatio: CGFloat = 2/3
    
    //State
    @State var isFaceUp: Bool = true
    
    var body: some View {
        ZStack {
            if isFaceUp { faceUpView }
            else { faceDownView }
        }
        .aspectRatio(aspectRatio, contentMode: .fit)
        .onTapGesture {
            isFaceUp.toggle()
        }
    }
    
    var faceUpView: some View {
        ZStack {
            RoundedRectangle(cornerRadius: cornerRadius)
                .foregroundColor(.white)
            
            RoundedRectangle(cornerRadius: cornerRadius)
                .strokeBorder(lineWidth: borderWidth)
                .foregroundColor(fillColor)
            
            Text(title)
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
        ContentView()
    }
}
