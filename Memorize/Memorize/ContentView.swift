//
//  ContentView.swift
//  Memorize
//
//  Created by Максим Митрофанов on 05.05.2023.
//

import SwiftUI

struct ContentView: View {
    @State var emojis = animalEmojis
    @State var shownEmojiCount = 4
    @State var fillColor: Color = .orange
   
    let columns = [GridItem(.adaptive(minimum: 80))]
    
    
    var body: some View {
        VStack {
            Text("Memorize!")
                .font(.system(size: 30, design: .serif))
                .padding(.top)
            ScrollView {
                LazyVGrid(columns: columns, spacing: 10){
                    ForEach(emojis[0..<shownEmojiCount], id: \.self) { emoji in
                        CardView(title: emoji, fillColor: fillColor)
                    }
                }
                .padding()
            }
            Spacer()
            themeChoosingButtons
            bottomButtons
        }
    }
    
    var themeChoosingButtons: some View {
        HStack {
            Button {
                emojis = ContentView.animalEmojis.shuffled()
                shownEmojiCount = 8
                fillColor = .orange
            } label: {
                Text(ContentView.animalEmojis[0])
            }
            
            Button {
                emojis = ContentView.vehicleEmojis.shuffled()
                shownEmojiCount = 10
                fillColor = .black
            } label: {
                Text(ContentView.vehicleEmojis[0])
            }
            
            Button {
                emojis = ContentView.fruitEmojis.shuffled()
                shownEmojiCount = 12
                fillColor = .green
            } label: {
                Text(ContentView.fruitEmojis[0])
            }
        }
        .buttonStyle(.bordered)
    }
    
    var bottomButtons: some View {
        HStack {
            //remove button
            Button {
                if shownEmojiCount > 2 { shownEmojiCount -= 1}
            } label: {
                Image(systemName: "minus.circle")
            }
            
            //add button
            Button {
                if shownEmojiCount < emojis.count { shownEmojiCount += 1}
            } label: {
                Image(systemName: "plus.circle")
            }
        }
        .buttonStyle(.bordered)
        .font(.title2)
        .padding()
    }
}

extension ContentView {
    static let vehicleEmojis = ["🚗","🚕","🚙","🚌","🚎","🏎️","🚓","🚑","🚒","🚐","🛻","🚚","🚛"]
    static let animalEmojis = ["🐶", "🐱", "🐭", "🐹", "🐰", "🦊", "🐻", "🐼", "🐻‍❄️", "🐨", "🐯", "🦁", "🐮", "🐷", "🐸", "🐵"]
    static let fruitEmojis = ["🍏","🍎","🍐","🍊","🍋","🍌","🍉","🍇","🍓","🫐","🍒","🍈","🍑","🥭"]
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
