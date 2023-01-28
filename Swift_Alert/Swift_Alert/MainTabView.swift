//
//  ContentView.swift
//  Swift_Alert
//
//  Created by coder on 16.01.2023.
//

import SwiftUI

/// Главный таб бар
struct MainTabView: View {
    
    // MARK: - Body
    var body: some View {
        TabView {
            StatusVPNView()
            PurchaseView()
            BacketView()
        }
        .environmentObject(viewModel)
    }
    
    // MARK: - Private properties
    @StateObject private var viewModel = PurchaseViewModel()
    
}

struct MainTabView_Previews: PreviewProvider {
    static var previews: some View {
        MainTabView()
    }
}
