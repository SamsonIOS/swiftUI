//
//  ButtonImageModifier.swift
//  Swift_Alert
//
//  Created by coder on 01.02.2023.
//

import SwiftUI

/// Модифаер картинки в кнопках
struct ButtonImageModifire: ViewModifier {

    // MARK: - Public Methods
    
    func body(content: Content) -> some View {
             content
            .scaledToFit()
            .frame(width: 50, height: 50)
            .foregroundColor(.gray)
         }
}
