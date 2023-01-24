//
//  ContentView.swift
//  Swift_Alert
//
//  Created by coder on 16.01.2023.
//

import SwiftUI

struct MainTabView: View {
    @StateObject private var viewModel = PurchaseViewModel()
    
    var body: some View {
        TabView {
            StatusVPNView()
            PurchaseView()
            BacketView()
        }
        .environmentObject(viewModel)
    }
    
}

struct MainTabView_Previews: PreviewProvider {
    static var previews: some View {
        MainTabView()
    }
}
