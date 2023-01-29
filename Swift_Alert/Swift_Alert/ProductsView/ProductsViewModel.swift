// ProductsViewModel.swift
// Copyright © RoadMap. All rights reserved.

import SwiftUI

/// Вью модель экрана со списком мебели
final class ProductsViewModel: ObservableObject {
    // MARK: - Constants

    private enum Constants {
        static var cabinetText = "cabinet"
        static var cabinetCapitalText = "Cabinet"
        static var chairText = "chair"
        static var chairCapitalText = "Chair"
        static var chairLoungeText = "chair.lounge"
        static var chairLoungeCapitalText = "Chair Lounge"
        static var sofaText = "sofa"
        static var sofaCapitalText = "Sofa"
        static var bedDoubleText = "bed.double"
        static var bedDoubleCapitalText = "Bed Double"
        static var cabinetPriceNumber = 110
        static var cabinetSalePriceNumber = 160
        static var chairPriceNumber = 70
        static var chairSalePriceNumber = 100
        static var chairLoungePriceNumber = 105
        static var chairLoungeSalePriceNumber = 130
        static var sofaPriceNumber = 150
        static var sofaSalePriceNumber = 180
        static var bedDoublePriceNumber = 200
        static var bedDoubleSalePriceNumber = 240
        static var zeroNumber = 0
        static var oneNumber = 1
    }

    // MARK: - Public Properties

    @Published var furnitures: [Furniture] = [
        Furniture(
            imageName: Constants.cabinetText,
            name: Constants.cabinetCapitalText,
            price: Constants.cabinetPriceNumber,
            salePrice: Constants.cabinetSalePriceNumber,
            count: Constants.zeroNumber
        ),
        Furniture(
            imageName: Constants.chairText,
            name: Constants.chairCapitalText,
            price: Constants.chairPriceNumber,
            salePrice: Constants.chairSalePriceNumber,
            count: Constants.zeroNumber
        ),
        Furniture(
            imageName: Constants.chairLoungeText,
            name: Constants.chairLoungeCapitalText,
            price: Constants.chairLoungePriceNumber,
            salePrice: Constants.chairLoungeSalePriceNumber,
            count: Constants.zeroNumber
        ),
        Furniture(
            imageName: Constants.sofaText,
            name: Constants.sofaCapitalText,
            price: Constants.sofaPriceNumber,
            salePrice: Constants.sofaSalePriceNumber,
            count: Constants.zeroNumber
        ),
        Furniture(
            imageName: Constants.bedDoubleText,
            name: Constants.bedDoubleCapitalText,
            price: Constants.bedDoublePriceNumber,
            salePrice: Constants.bedDoubleSalePriceNumber,
            count: Constants.zeroNumber
        ),
        Furniture(
            imageName: Constants.cabinetText,
            name: Constants.cabinetCapitalText,
            price: Constants.cabinetPriceNumber,
            salePrice: Constants.cabinetSalePriceNumber,
            count: Constants.zeroNumber
        ),
        Furniture(
            imageName: Constants.chairText,
            name: Constants.chairCapitalText,
            price: Constants.chairPriceNumber,
            salePrice: Constants.chairSalePriceNumber,
            count: Constants.zeroNumber
        ),
        Furniture(
            imageName: Constants.chairLoungeText,
            name: Constants.chairLoungeCapitalText,
            price: Constants.chairLoungePriceNumber,
            salePrice: Constants.chairLoungeSalePriceNumber,
            count: Constants.zeroNumber
        ),
        Furniture(
            imageName: Constants.sofaText,
            name: Constants.sofaCapitalText,
            price: Constants.sofaPriceNumber,
            salePrice: Constants.sofaSalePriceNumber,
            count: Constants.zeroNumber
        ),
        Furniture(
            imageName: Constants.bedDoubleText,
            name: Constants.bedDoubleCapitalText,
            price: Constants.bedDoublePriceNumber,
            salePrice: Constants.bedDoubleSalePriceNumber,
            count: Constants.zeroNumber
        )
    ]

    // MARK: - Public Methods

    func getSumPrice() -> Int {
        var sumPrice = Constants.zeroNumber
        for furniture in furnitures {
            sumPrice += furniture.salePrice * furniture.count
        }
        return sumPrice
    }

    func reduceFurnitureCount(index: Int) {
        guard index < furnitures.count else { return }
        if furnitures[index].count > Constants.zeroNumber {
            furnitures[index].count -= Constants.oneNumber
        }
    }

    func increaseFurnitureCount(index: Int) {
        guard index < furnitures.count else { return }
        furnitures[index].count += Constants.oneNumber
    }
}
