//
//  CustomStepperView.swift
//  Swift_Alert
//
//  Created by coder on 02.02.2023.
//

import SwiftUI

/// Кастомный степпер
struct CustomStepperView: View {
    
    // MARK: - Constants
    
    private enum Constants {
        static let chevronLeftImageName = "chevron.left"
        static let chevronRightImageName = "chevron.right"
        static let temperatureText = "° C"
    }

    // MARK: - Public properties
        
    @Binding var value: Int

    var body: some View {
        HStack {
            Button {
                value -= 1
            } label: {
                Image(systemName: Constants.chevronLeftImageName)
            }
            Text("\(15 + value)\(Constants.temperatureText)")
                .font(.system(size: 34))
                .padding(.horizontal)
            Button {
                value += 1
            } label: {
                Image(systemName: Constants.chevronRightImageName)
            }
        }
        .frame(width: 300, alignment: .center)
        .foregroundColor(.white)
    }
}
