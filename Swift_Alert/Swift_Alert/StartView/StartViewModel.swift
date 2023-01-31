// StartViewModel.swift
// Copyright © RoadMap. All rights reserved.

import SwiftUI

/// Вью модель стартового экрана
final class StartViewModel: ObservableObject {
    // MARK: - Public Properties

    @Published var isDeveloperViewShow = false

    // MARK: - Public Methods

    func developerViewAnimate() {
        withAnimation(.linear(duration: 0.4)) {
            self.isDeveloperViewShow = true
        }
        DispatchQueue.main.asyncAfter(deadline: .now() + 5) {
            withAnimation(.linear(duration: 0.4)) {
                self.isDeveloperViewShow = false
            }
        }
    }
}
