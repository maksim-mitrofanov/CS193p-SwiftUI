//
//  SetCardView.swift
//  SET Game
//
//  Created by Максим Митрофанов on 19.05.2023.
//

import SwiftUI

struct SetCardView: View {
    let model: SetCardModel
    let isSelected: Bool
    
    var body: some View {
        ZStack {
            RoundedRectangle(cornerRadius: 10)
                .foregroundColor(.white)
                .shadow(color: .black.opacity(0.1),radius: 5)
            
            SetGameThemeModel.getDisplayedShape(for: model)
                .padding(paddingSize)
        }
        .overlay {
            RoundedRectangle(cornerRadius: 10)
                .strokeBorder(lineWidth: 3)
                .foregroundColor(.black)
                .opacity(isSelected ? 1 : 0)
        }
    }
    
    var paddingSize: CGFloat {
        switch model.symbolCount {
        case .one: return 15
        case .two: return 12
        case .three: return 10
        }
    }
}
