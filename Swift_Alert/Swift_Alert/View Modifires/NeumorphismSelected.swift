//
//  NeumorphismSelected.swift
//  Swift_Alert
//
//  Created by coder on 01.02.2023.
//

import SwiftUI

/// Нажатая кнопка
struct NeumorphismSelected: ViewModifier {

    // MARK: - Public Methods
    
    func body(content: Content) -> some View {
        content
            .shadow(
                color: Color.lightShadow,
                radius: 6,
                x: -6,
                y: -6
            )
            .shadow(
                color: Color.darkShadow,
                radius: 6,
                x: 6,
                y: 6
            )
    }
}
