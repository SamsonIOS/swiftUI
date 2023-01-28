//
//  vpn.swift
//  Swift_Alert
//
//  Created by coder on 23.01.2023.
//

import SwiftUI

/// Вью модель первого экрана
final class StatusVPNViewModel: ObservableObject {
    
    // MARK: - Public properties
    @Published var isOn = false
    @Published var index = 0
    
    var countryFlags = ["italy", "dublin", "canada"]
    
    // MARK: - Public Methods
    
    func getCountryImage() -> String {
        countryFlags[index]
    }
}
