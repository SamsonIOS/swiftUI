// Setting.swift
// Copyright © RoadMap. All rights reserved.

import Foundation

/// Настройка
struct Setting: Identifiable {
    /// Название
    let title: String
    /// Описание
    let description: String
    /// Включена ли настройка
    var isOn: Bool
    /// Идентификатор
    let id = UUID()
}
