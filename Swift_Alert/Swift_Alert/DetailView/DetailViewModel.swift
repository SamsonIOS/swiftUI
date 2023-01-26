// DetailViewModel.swift
// Copyright © RoadMap. All rights reserved.

import SwiftUI

/// Вью модель экрана с мебелью
final class DetailViewModel: ObservableObject {
    // MARK: - Constants

    private enum Constants {
        static var emptyText = ""
        static var minTextNumber = 0
        static var maxTextNumber = 100
    }

    // MARK: - Public Properties

    @Published var lastDescriptionText = Constants.emptyText

    // MARK: - Public Methods

    func descriptionText(totalChars: String) -> String {
        if totalChars.count <= Constants.maxTextNumber {
            lastDescriptionText = totalChars
            return lastDescriptionText
        } else {
            return lastDescriptionText
        }
    }
}
