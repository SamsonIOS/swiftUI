//
//  CarSettingViewModel.swift
//  Swift_Alert
//
//  Created by coder on 03.02.2023.
//

import SwiftUI

/// Вью модель экрана с опциями автомобиля
final class CarSettingViewModel: ObservableObject {
    // MARK: - Public properties
    @Published var isNavigationTapped = false
    @Published var isCarClose = false
    @Published var tagSelected = 0
}

