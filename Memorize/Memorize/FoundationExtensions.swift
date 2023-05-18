//
//  FoundationExtensions.swift
//  Memorize
//
//  Created by Максим Митрофанов on 18.05.2023.
//

import Foundation

extension Array where Element: Hashable {
    var oneAndOnly: Element? {
        self.count == 1 ? self[0] : nil
    }
}
