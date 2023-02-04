//
//  TabItem.swift
//  Swift_Alert
//
//  Created by coder on 04.02.2023.
//

import Foundation

/// Элемент таббара
struct TabItem: Identifiable, Equatable {
    
    /// Идентификатор элемента
    var id = UUID()
    
    /// Иконка элемента
    var icon: String
}
