// DetailViewModel.swift
// Copyright © RoadMap. All rights reserved.

import SwiftUI

/// Вью модель экрана с мебелью
final class DetailViewModel: ObservableObject {
    // MARK: - Public Properties

    @Published var lastDescriptionText = ""

    // MARK: - Public Methods

    func descriptionText(totalChars: String) -> String {
        if totalChars.count <= 100 {
            lastDescriptionText = totalChars
            return lastDescriptionText
        } else {
            return lastDescriptionText
        }
    }
}
