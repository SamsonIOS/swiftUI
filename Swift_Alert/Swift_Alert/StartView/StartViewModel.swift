// StartViewModel.swift
// Copyright © RoadMap. All rights reserved.

import SwiftUI

/// Вью модель стартового экрана
final class StartViewModel: ObservableObject {
    // MARK: - Public Properties

    @Published var isDeveloperViewShown = false

    // MARK: - Public Methods

    func developerViewAnimate() {
        withAnimation(.linear(duration: 0.4)) {
            self.isDeveloperViewShown = true
        }
        DispatchQueue.main.asyncAfter(deadline: .now() + 5) {
            withAnimation(.linear(duration: 0.4)) {
                self.isDeveloperViewShown = false
            }
        }
    }
}
