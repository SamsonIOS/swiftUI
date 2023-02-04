//
//  CustomTabBackgroundView.swift
//  Swift_Alert
//
//  Created by coder on 04.02.2023.
//

import SwiftUI

/// Бэкграунд кастомного табвью
struct CustomTabViewBackground: Shape {
    
    // MARK: - Public Methods
    
    func path(in rect: CGRect) -> Path {
        var path = Path()
        path.move(to: CGPoint(x: 0, y: 796))
        path.addLine(to: CGPoint(x: 16.47, y: 778.94))
        path.addCurve(
            to: CGPoint(x: 47.03, y: 766),
            control1: CGPoint(x: 24.46, y: 770.67),
            control2: CGPoint(x: 35.49, y: 766)
        )
        path.addLine(to: CGPoint(x: 125.28, y: 766))
        path.addCurve(
            to: CGPoint(x: 149.45, y: 773.52),
            control1: CGPoint(x: 133.93, y: 766),
            control2: CGPoint(x: 142.36, y: 768.62)
        )
        path.addLine(to: CGPoint(x: 170.6, y: 788.12))
        path.addCurve(
            to: CGPoint(x: 222.4, y: 788.12),
            control1: CGPoint(x: 186.17, y: 798.87),
            control2: CGPoint(x: 206.83, y: 798.87)
        )
        path.addLine(to: CGPoint(x: 243.55, y: 773.52))
        path.addCurve(
            to: CGPoint(x: 267.72, y: 766),
            control1: CGPoint(x: 250.64, y: 768.62),
            control2: CGPoint(x: 259.07, y: 766)
        )
        path.addLine(to: CGPoint(x: 345.97, y: 766))
        path.addCurve(
            to: CGPoint(x: 376.53, y: 778.94),
            control1: CGPoint(x: 357.51, y: 766),
            control2: CGPoint(x: 368.54, y: 770.67)
        )
        path.addLine(to: CGPoint(x: 393, y: 796))
        path.addLine(to: CGPoint(x: 393, y: 844))
        path.addLine(to: CGPoint(x: 0, y: 844))
        path.addLine(to: CGPoint(x: 0, y: 796))
        path.closeSubpath()
        return path
    }
}
