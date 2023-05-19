//
//  AspectVGrid.swift
//  Memorize
//
//  Created by Максим Митрофанов on 18.05.2023.
//

import SwiftUI

struct AspectVGrid<Item: Identifiable, ItemView: View>: View {
    
    var items: [Item]
    var aspectRatio: CGFloat
    var content: (Item) -> ItemView
    var spacing: CGFloat = 4
    var minItemWidth: CGFloat = 80
    
    
    var body: some View {
        GeometryReader { geometry in
            VStack {
                let maxWidth = widthThatFits(itemCount: items.count, in: geometry.size, itemAspectRatio: aspectRatio)
                let width = max(minItemWidth, maxWidth)
                
                
                ScrollView {
                    LazyVGrid(columns: [adaptiveGridItem(with: width)], spacing: 0) {
                        ForEach(items) { item in
                            content(item)
                                .aspectRatio(aspectRatio, contentMode: .fit)
                                .padding(spacing)
                        }
                    }
                }
                .scrollIndicators(.hidden)
                
                Spacer(minLength: 0)
            }
        }
    }
    
    init(items: [Item], aspectRatio: CGFloat, @ViewBuilder content: @escaping (Item) -> ItemView, spacing: CGFloat = 4) {
        self.items = items
        self.aspectRatio = aspectRatio
        self.content = content
        self.spacing = spacing
    }
    
    private func adaptiveGridItem(with width: CGFloat) -> GridItem {
        var gridItem = GridItem(.adaptive(minimum: width))
        gridItem.spacing = 0
        return gridItem
    }
    
    private func widthThatFits(itemCount: Int, in size: CGSize, itemAspectRatio: CGFloat) -> CGFloat {
        var columnCount = 1
        var rowCount = itemCount
        
        repeat {
            let itemWidth = size.width / CGFloat(columnCount)
            let itemHeigh = itemWidth / aspectRatio
            
            if CGFloat(rowCount) * itemHeigh < size.height {
                break
            }
            columnCount += 1
            rowCount = (itemCount + (columnCount - 1)) / columnCount
        } while columnCount < itemCount
        
        if columnCount > itemCount {
            columnCount = itemCount
        }
        
        return floor(size.width / CGFloat(columnCount))
    }
}
