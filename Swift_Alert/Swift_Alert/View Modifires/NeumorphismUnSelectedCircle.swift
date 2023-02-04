//
//  NeumorphismUnSelectedCircle.swift
//  Swift_Alert
//
//  Created by coder on 01.02.2023.
//

import SwiftUI

/// Не нажатая круглая кнопка
struct NeumorphismUnSelectedCircle: ViewModifier {

    // MARK: - Public Methods
    func body(content: Content) -> some View {
        content
            .padding(.all, 10)
            .background(
                Circle()
                    .fill(Color.backgroundColor)
            )
            .neumorphismUnSelectedStyle()
            
    }
}
