//
//  ContentView.swift
//  Memorize
//
//  Created by Максим Митрофанов on 05.05.2023.
//

import SwiftUI

struct ContentView: View {
    var body: some View {
        VStack(spacing: 0){
            ZStack {
                RoundedRectangle(cornerRadius: 25)
                    .foregroundColor(.white)
                
                RoundedRectangle(cornerRadius: 25)
                    .strokeBorder(lineWidth: 4)
                    .foregroundColor(.orange)
                
                VStack {
                    Text("Memorize 👋")
                        .font(.largeTitle)
                }
                
            }
            .padding(.horizontal, 30)
            .padding(.vertical, 120)
            .background(Color.black)
        }
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
