//
//  Swift_AlertApp.swift
//  Swift_Alert
//
//  Created by coder on 16.01.2023.
//

import SwiftUI

@main
struct Swift_AlertApp: App {
    var body: some Scene {
        WindowGroup {
            if #available(iOS 16.0, *) {
                NavigationStack {
                    LaunchScreenView()
                        .environment(\.colorScheme, .dark)
                }
            } else {
                NavigationView {
                    LaunchScreenView()
                        .environment(\.colorScheme, .dark)
                }
            }
        }
    }
}
