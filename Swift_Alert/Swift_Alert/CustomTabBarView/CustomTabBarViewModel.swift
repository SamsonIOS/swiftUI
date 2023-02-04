//
//  CustomTabBarViewModel.swift
//  Swift_Alert
//
//  Created by coder on 04.02.2023.
//

import SwiftUI

/// Модель кастомного табвью
final class CustomTabViewModel: ObservableObject {
    
    // MARK: - Public Properties
    
    @Published var tabs: [TabItem] = []
}
