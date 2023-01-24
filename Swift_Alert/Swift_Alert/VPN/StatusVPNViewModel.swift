//
//  vpn.swift
//  Swift_Alert
//
//  Created by coder on 23.01.2023.
//

import SwiftUI

final class StatusVPNViewModel: ObservableObject {
    @Published var isOn = false
    @Published var index = 0
    
    // 
    var countryFlags = ["italy", "dublin", "canada"]
    
    func getCountryImage() -> String {
        countryFlags[index]
    }
}
