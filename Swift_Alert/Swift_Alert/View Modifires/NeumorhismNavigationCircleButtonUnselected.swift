//
//  NeumorhismNavigationCircleButtonUnselected.swift
//  Swift_Alert
//
//  Created by coder on 01.02.2023.
//

import SwiftUI

/// Не нажатая кнопка навигации
struct NeumorhismNavigationCircleButtonUnselected: ViewModifier {

    // MARK: - Public Methods
    
    func body(content: Content) -> some View {
        content
            .frame(width: 40,
                   height: 40)
            .padding()
            .background(RoundedRectangle(cornerRadius: 50)
            .fill(
                LinearGradient(
                    colors: [Color("lightShadow"), Color("darkShadow")],
                               startPoint: .topLeading,
                               endPoint: .bottomTrailing)
            ))
            .overlay {
                Circle()
                    .stroke(
                        LinearGradient(colors: [Color("lightShadow"), Color("darkShadow").opacity(0.2)],
                                       startPoint: .topLeading,
                                       endPoint: .bottomTrailing), lineWidth: 2
                    )
            }
            .neumorphismUnSelectedStyle()
    }
}
