//
//  CustomChargeProggresView.swift
//  Swift_Alert
//
//  Created by coder on 04.02.2023.
//

import SwiftUI

/// Прогрессвью
struct CustomChargeProgressViewShape: Shape {
    
    // MARK: - Public Methods
    
    func path(in rect: CGRect) -> Path {
        var path = Path()
        path.move(to: CGPoint(x: rect.minX, y: rect.maxY))
        path.addLine(to: CGPoint(x: rect.minX, y: rect.maxY * 0.6))
        path.addLine(to: CGPoint(x: rect.maxX * 0.05, y: rect.minY))
        path.addLine(to: CGPoint(x: rect.maxX * 0.95, y: rect.minY))
        path.addLine(to: CGPoint(x: rect.maxX, y: rect.maxY * 0.6))
        path.addLine(to: CGPoint(x: rect.maxX, y: rect.maxY))
        path.closeSubpath()
        return path
    }
}
