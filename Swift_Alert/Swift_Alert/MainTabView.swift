//
//  ContentView.swift
//  Swift_Alert
//
//  Created by coder on 16.01.2023.
//

import SwiftUI

/// Главный таб бар
struct MainTabView: View {
    
    // MARK: - @StateObject
    @StateObject private var viewModel = PurchaseViewModel()
    
    // MARK: - Body
    var body: some View {
        TabView {
            StatusVPNView()
            PurchaseView()
            BacketView()
        }
        .environmentObject(viewModel)
    }
    
}

/// Пре-показ главного таб бара
struct MainTabView_Previews: PreviewProvider {
    static var previews: some View {
        MainTabView()
    }
}
