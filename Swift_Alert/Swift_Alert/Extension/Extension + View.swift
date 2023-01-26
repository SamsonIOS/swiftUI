// Extension + View.swift
// Copyright © RoadMap. All rights reserved.

import SwiftUI

/// Модификаторы
extension View {
    // MARK: - Public Methods

    func redButtonModifier() -> some View {
        modifier(RedButtonModifier())
    }

    func verificationTextEditorModifier() -> some View {
        modifier(VerificationTextEditorModifier())
    }
}

/// Красная округленная кнопка
struct RedButtonModifier: ViewModifier {
    // MARK: - Public Methods

    func body(content: Content) -> some View {
        content
            .font(Font.system(size: 30, weight: .bold))
            .foregroundColor(.white)
            .frame(width: 300, height: 80)
            .background(Color.red)
            .cornerRadius(40)
    }
}

/// Поле ввода кода верификации
struct VerificationTextEditorModifier: ViewModifier {
    // MARK: - Constants

    private enum Constants {
        static var largeFontSize: CGFloat = 40
        static var defaultWidth: CGFloat = 40
    }

    // MARK: - Public Methods

    func body(content: Content) -> some View {
        content
            .font(.system(size: Constants.largeFontSize))
            .keyboardType(.numberPad)
            .frame(width: Constants.defaultWidth)
            .overlay(
                Rectangle()
                    .stroke(.gray, lineWidth: 3)
                    .offset(x: -8)
            )
    }
}
