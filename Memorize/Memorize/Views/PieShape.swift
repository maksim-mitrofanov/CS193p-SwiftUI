//
//  PieShape.swift
//  Memorize
//
//  Created by Максим Митрофанов on 18.05.2023.
//

import SwiftUI

struct PieShape: Shape {
    
    var startAngle: Angle
    var endAngle: Angle
    var clockwise: Bool = false
    
    var animatableData: AnimatablePair<Double, Double> {
        get {
            AnimatablePair(startAngle.radians, endAngle.radians)
        }
        set {
            startAngle = Angle.radians(newValue.first)
            endAngle = Angle.radians(newValue.second)
        }
    }
        
    func path(in rect: CGRect) -> Path {
        let centerPoint = CGPoint(x: rect.midX, y: rect.midY)
        let radius = min(rect.width, rect.height) / 2
        
        let start = CGPoint(
            x: centerPoint.x + radius * CGFloat(cos(startAngle.radians)),
            y: centerPoint.y + radius * CGFloat(sin(startAngle.radians))
        )
        
        var shapePath = Path()
        shapePath.move(to: centerPoint)
        shapePath.addLine(to: start)
        shapePath.addArc(
            center: centerPoint,
            radius: radius,
            startAngle: startAngle,
            endAngle: endAngle,
            clockwise: clockwise
        )
        shapePath.addLine(to: centerPoint)
        return shapePath
    }
}
