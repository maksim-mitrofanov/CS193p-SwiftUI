//
//  NSMutableAttributedString.swift
//  SET Game
//
//  Created by Максим Митрофанов on 19.05.2023.
//

import SwiftUI

extension NSMutableAttributedString {
    
    func asText() -> some View {
        let attributedString = NSAttributedString(attributedString: self)
        let attributes = self.attributes(at: 0, effectiveRange: nil)
        let text = Text(attributedString.string)
        let strokeWidth = attributes[.strokeWidth] as? NSNumber ?? 0
        let strokeColor = attributes[.strokeColor] as? UIColor
                
        var textForegroundColor: Color {
            if let color = attributes[.foregroundColor] as? UIColor {
                return Color(color)
            }
            return .primary
        }
        
        var strokedText: some View {
            VStack {
                if let strokeColor {
                    let strokeText = Text(string)
                        .font(.body)
                        .foregroundColor(Color(strokeColor))
                        .offset(x: 0, y: -CGFloat(truncating: strokeWidth))
                    
                    text
                        .foregroundColor(.clear)
                        .overlay(strokeText)
                }
                
                else {
                    text
                        .foregroundColor(.primary)
                        .background(
                            Text(string)
                                .font(.body)
                                .foregroundColor(.primary)
                                .blur(radius: CGFloat(truncating: strokeWidth))
                        )
                }
            }
        }
            
//
//        if let strokeWidth = attributes[.strokeWidth] as? NSNumber {
//            if let strokeColor = attributes[.strokeColor] as? UIColor {
//                let strokeText = Text(string)
//                    .font(.body)
//                    .foregroundColor(Color(strokeColor))
//                    .offset(x: 0, y: -CGFloat(truncating: strokeWidth))
//
//                return VStack {
//                    text
//                        .overlay(strokeText)
//                }
//            } else {
//                return VStack {
//                    text
//                        .foregroundColor(.primary)
//                        .background(
//                            Text(string)
//                                .font(.body)
//                                .foregroundColor(.primary)
//                                .blur(radius: CGFloat(truncating: strokeWidth))
//                        )
//                }
//            }
//        }
        
        var result: some View {
            VStack {
                strokedText
                    .foregroundColor(textForegroundColor)
                }
        }
        
        return result
    }
}
