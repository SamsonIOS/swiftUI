//
//  TabItemPreferencyKey.swift
//  Swift_Alert
//
//  Created by coder on 04.02.2023.
//

import SwiftUI

/// Передача данных в иерархию представлений
struct TabItemPreferenceKey: PreferenceKey {

    // MARK: - Public Properties
    
    static var defaultValue: [TabItem] = []

    // MARK: - Public Methods
    
    static func reduce(value: inout [TabItem], nextValue: () -> [TabItem]) {
        value += nextValue()
    }
}
