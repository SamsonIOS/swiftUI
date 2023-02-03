//
//  CustomStepperView.swift
//  Swift_Alert
//
//  Created by coder on 02.02.2023.
//

import SwiftUI

/// Кастомный степпер
struct CustomStepperView: View {

    // MARK: - Public properties
        
    @Binding var value: Int

    var body: some View {
        HStack {
            Button {
                value -= 1
            } label: {
                Image(systemName: "chevron.left")
            }
            Text("\(15 + value)° C")
                .font(.system(size: 34))
                .padding(.horizontal)
            Button {
                value += 1
            } label: {
                Image(systemName: "chevron.right")
            }
        }
        .frame(width: 300, alignment: .center)
        .foregroundColor(.white)
    }
}
