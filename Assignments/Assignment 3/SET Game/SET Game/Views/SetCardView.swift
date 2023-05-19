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
        ZStack {
            RoundedRectangle(cornerRadius: 10)
                .foregroundColor(.white)
                .shadow(color: .black.opacity(0.1),radius: 5)
            
            SetGameThemeModel.getDisplayedShape(for: model)
                .padding(paddingSize)
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
