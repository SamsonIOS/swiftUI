//
//  TabItemModifire.swift
//  Swift_Alert
//
//  Created by coder on 04.02.2023.
//

import SwiftUI

/// Модификатор элемента таббара
struct TabItemModifire: ViewModifier {
    
    // MARK: - Public Properties
    let tabBatItem: TabItem

    // MARK: - Pubcic Methods
    
    func body(content: Content) -> some View {
        content
            .preference(key: TabItemPreferenceKey.self, value: [tabBatItem])
    }
}
