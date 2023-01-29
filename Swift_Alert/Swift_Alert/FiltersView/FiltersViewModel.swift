// FiltersViewModel.swift
// Copyright © RoadMap. All rights reserved.

import SwiftUI

/// Вью модель экрана с фильтрами
final class FiltersViewModel: ObservableObject {
    // MARK: - Constants

    private enum Constants {
        static var chairLoungeText = "chair.lounge"
        static var sofaText = "sofa"
        static var bedDoubleText = "bed.double"
        static var cabinetText = "cabinet"
        static var chairText = "chair"
    }

    // MARK: - Public Properties

    @Published var selectedColor: Color = .red
    @Published var colors: [Color] = [
        .red, .gray, .purple, .white, .black,
        .orange, .pink, .yellow, .blue, .blue.opacity(0.5),
        .brown, .cyan, .green, .indigo, .mint,
        .primary, .secondary, .teal, .mint.opacity(0.5), .red.opacity(0.5)
    ]
    @Published var imageFurnitureName: [String] = [
        Constants.chairLoungeText,
        Constants.sofaText,
        Constants.bedDoubleText,
        Constants.cabinetText,
        Constants.chairText
    ]
}
