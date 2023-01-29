// Furniture.swift
// Copyright © RoadMap. All rights reserved.

import Foundation

/// Мебель
struct Furniture: Identifiable {
    /// Наименование изображения мебели
    let imageName: String
    /// Наименование мебели
    let name: String
    /// Цена
    let price: Int
    /// Цена со скидкой
    let salePrice: Int
    /// Количество
    var count: Int
    /// Идентификатор
    let id = UUID()
}
