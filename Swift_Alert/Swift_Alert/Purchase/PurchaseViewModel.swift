//
//  VpnViewModel.swift
//  Swift_Alert
//
//  Created by coder on 23.01.2023.
//

import SwiftUI

/// Вью модель экрана с описанием тарифов
final class PurchaseViewModel: ObservableObject {
    // MARK: - Public properties
    
    @Published var index = 0
    
    // MARK: - Private properties
    
    private var ratePricec = [99, 179]
    private var infoRates = ["7 дней", "30 дней"]
    
    // MARK: - Public Methods
    
    func getPrice() -> Int {
        ratePricec[index]
    }
    
    func getTarif() -> String {
        infoRates[index]
    }
}
