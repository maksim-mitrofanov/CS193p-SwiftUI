//
//  SetCardModel.swift
//  SET Game
//
//  Created by Максим Митрофанов on 06.02.2023.
//

import Foundation

struct SetCardModel: Equatable, Identifiable {
    let symbol: GameSymbol
    let symbolCount: SymbolCount
    let fillStyle: FillStyle
    let color: SymbolColor
    
    let id: String = UUID().uuidString
}


extension SetCardModel {
    enum FillStyle: CaseIterable {
        case filled, outlined, striped
    }
    
    enum GameSymbol: CaseIterable {
        case rect, square, circle
    }
    
    enum SymbolCount: Int, CaseIterable {
        case one = 1
        case two = 2
        case three = 3
    }
    
    enum SymbolColor: CaseIterable  {
        case red, green, purple
    }
}
