//
//  StartViewModel.swift
//  Swift_Alert
//
//  Created by coder on 03.02.2023.
//

import SwiftUI

/// Вью модель экрана блокировки
final class StartViewModel: ObservableObject {
    // MARK: - Public properties
    @Published var isCarClose = false
    @Published var isCarSettingsViewShown = false
}

