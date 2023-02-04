//
//  Button.swift
//  Swift_Alert
//
//  Created by coder on 02.02.2023.
//

import SwiftUI

/// Кнопка навигации
struct NavigationButton: View {

    // MARK: - Public properties
    
    var body: some View {
        Button {
            actionHandler()
        } label: {
            ZStack {
                Circle()
                    .fill(
                        LinearGradient(
                            colors: [Color.leftButtonThirdEllipseFirstColor.opacity(0.4), Color.leftButtonThirdEllipseSecondColor.opacity(0.7)],
                            startPoint: .top,
                            endPoint: .bottomTrailing)
                    )
                    .frame(width: 62)
                    .shadow(color: .white, radius: 10, x: -5, y: -5).opacity(0.6)
                    .shadow(color: .black, radius: 10, x: 5, y: 5).opacity(0.5)
                Circle()
                    .fill(
                        LinearGradient(colors: [Color.leftButtonSecondEllipseFirstColor.opacity(0.3), Color.leftButtonSecondEllipseSecondColor.opacity(0.5)], startPoint: .top, endPoint: .trailing)
                    )
                    .frame(width: 50)
                Circle()
                    .stroke(
                        LinearGradient(colors: [Color.leftButtonFirstEllipseFirstColor.opacity(0.5), Color.leftButtonFirstEllipseSecondColor.opacity(0.2)], startPoint: .topLeading, endPoint: .bottomTrailing)
                        , lineWidth: 1)
                    .frame(width: 50)
                Image(systemName: iconName)
                    .frame(width: 12, height: 22)
                    .padding()
            }
        }
    }
    
    let actionHandler: () -> ()
    let iconName: String
}

