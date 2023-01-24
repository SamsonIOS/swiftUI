//
//  VpnViewModel.swift
//  Swift_Alert
//
//  Created by coder on 23.01.2023.
//

import SwiftUI

final class PurchaseViewModel: ObservableObject {
    @Published var index = 0
    @Published var pulstate = false
    private var price = [99, 179]
    private var tarif = ["7 дней", "30 дней"]
    
    func getPrice() -> Int {
        price[index]
    }
    
    func getTarif() -> String {
        tarif[index]
    }
}
