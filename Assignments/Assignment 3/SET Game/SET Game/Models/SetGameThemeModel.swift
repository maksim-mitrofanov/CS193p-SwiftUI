//
//  SetGameThemeModel.swift
//  SET Game
//
//  Created by Максим Митрофанов on 07.02.2023.
//

import SwiftUI

struct SetGameThemeModel {
    private static func getBaseColor(for card: SetCardModel) -> Color {
        let cardColor: Color = {
            switch card.color {
            case .red: return .red
            case .green: return .green
            case .purple: return .purple
            }
        }()
        
        return cardColor
    }
    
    private static func getFillColor(for card: SetCardModel) -> Color {
        let cardColor = getBaseColor(for: card)
        let colorWithOpacity: Color = {
            switch card.fillStyle {
            case .filled: return cardColor
            case .outlined: return .clear
            case .striped: return cardColor.opacity(0.2)
            }
        }()
        
        return colorWithOpacity
    }
    
    private static func getStrokeColor(for card: SetCardModel) -> Color {
        let cardColor = getBaseColor(for: card)
        
        let strokeColor: Color = {
            switch card.fillStyle {
            case .filled: return Color.black.opacity(0.3)
            case .striped: return cardColor
            case .outlined: return cardColor
            }
        }()
        
        return strokeColor
    }
    
    private static func cardShape(for card: SetCardModel) -> some View {
        VStack {
            let symbolCount = card.symbolCount.rawValue
            let fillColor = getFillColor(for: card)
            let strokeColor = getStrokeColor(for: card)
            let isStroked = card.fillStyle != .filled
            
            ForEach(0..<symbolCount) { _ in
                switch card.symbol {
                case .square:
                    getSquareShape(fillColor: fillColor, strokeColor: strokeColor, isStroked: isStroked)
                case .circle:
                    getSquareShape(fillColor: fillColor, strokeColor: strokeColor, isStroked: isStroked)
                case .rect:
                    getRectangleShape(fillColor: fillColor, strokeColor: strokeColor, isStroked: isStroked)
                }
            }
        }
    }
    
    private static func getRectangleShape(fillColor: Color, strokeColor: Color, isStroked: Bool) -> some View {
        let shape = RoundedRectangle(cornerRadius: 5)
        let aspectRatio: CGFloat = 2/1
        
        return VStack {
            if isStroked {
                ZStack {
                    shape
                        .stroke()
                        .foregroundColor(strokeColor)
                    
                    shape
                        .foregroundColor(fillColor)
                }
                .aspectRatio(aspectRatio, contentMode: .fit)
            }
            
            else {
                shape
                    .foregroundColor(fillColor)
                    .aspectRatio(aspectRatio, contentMode: .fit)
            }
        }
    }
    
    private static func getSquareShape(fillColor: Color, strokeColor: Color, isStroked: Bool) -> some View {
        let shape = RoundedRectangle(cornerRadius: 5)
        let aspectRatio: CGFloat = 1/1
        
        return VStack {
            if isStroked {
                ZStack {
                    shape
                        .stroke()
                        .foregroundColor(strokeColor)
                    
                    shape
                        .foregroundColor(fillColor)
                }
                .aspectRatio(aspectRatio, contentMode: .fit)
                .rotationEffect(Angle(degrees: 45))
            }
            
            else {
                shape
                    .foregroundColor(fillColor)
                    .aspectRatio(aspectRatio, contentMode: .fit)
                    .rotationEffect(Angle(degrees: 45))

            }
        }
    }
    
    private static func getCircleShape(fillColor: Color, strokeColor: Color, isStroked: Bool) -> some View {
        let shape = Circle()
        let aspectRatio: CGFloat = 1/1
        
        return VStack {
            if isStroked {
                ZStack {
                    shape
                        .stroke()
                        .foregroundColor(strokeColor)
                    
                    shape
                        .foregroundColor(fillColor)
                }
                .aspectRatio(aspectRatio, contentMode: .fit)
            }
            
            else {
                shape
                    .foregroundColor(fillColor)
                    .aspectRatio(aspectRatio, contentMode: .fit)

            }
        }
    }
    
//    private static func getShape(for card: SetCardModel) -> some View {
//        let cardShape: some View = {
//            switch card.symbol {
//            case .rect: return rectangleShape
//            case .circle: return circleShape
//            case .square: return squareShape
//            }
//        }()
//
//        var rectangleShape: some View {
//            RoundedRectangle(cornerRadius: 10)
//                .aspectRatio(5/2, contentMode: .fit)
//        }
//
//        var circleShape: some View {
//            Circle()
//                .aspectRatio(1/1, contentMode: .fit)
//        }
//
//        var squareShape: some View {
//            RoundedRectangle(cornerRadius: 1)
//                .aspectRatio(1/1, contentMode: .fit)
//        }
//
//        return cardShape
//    }
    
//    static func getAttributedTitle(for card: SetCardModel) -> NSMutableAttributedString {
//        let cardTitle = SetGameThemeModel.getTitle(for: card)
//        let cardTitleAttributes: [NSAttributedString.Key : Any] = [
//            .strokeColor : SetGameThemeModel.getStrokeColor(for: card),
//            .strokeWidth: -5,
//            .foregroundColor : SetGameThemeModel.getFillColor(for: card)
//        ]
//        
//        return NSMutableAttributedString(string: cardTitle, attributes: cardTitleAttributes)
//    }
    
    static func getDisplayedShape(for card: SetCardModel) -> some View {
        VStack {
            cardShape(for: card)
        }
    }
}

