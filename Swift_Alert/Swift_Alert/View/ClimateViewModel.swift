//
//  ClimateViewModel.swift
//  Swift_Alert
//
//  Created by coder on 03.02.2023.
//

import SwiftUI

/// Вью модель экрана климат контроля
final class ClimateViewModel: ObservableObject {
    
    // MARK: - Public properties
    
    @Published var isPowerButtonSelected = false
    @Published var isTap = false
    @Published var settings = false
    @Published var isAcButtonTapped = false
    @Published var isAlertShown = false
    @Published var indexState = 0
    @Published var acValue = 0.0
    @Published var fanValue = 0.0
    @Published var heatValue = 0.0
    @Published var autoValue = 0.0
    @Published var color = Color.blue
   
    // MARK: - Public methods
    
    func calculateActualTemperature() -> Int {
        Int(15.0 + acValue)
    }
    
    func getStepperValue(_ newValue: Int) {
        if 0...15 ~= newValue {
            acValue = CGFloat(newValue)
        }
    }
}
