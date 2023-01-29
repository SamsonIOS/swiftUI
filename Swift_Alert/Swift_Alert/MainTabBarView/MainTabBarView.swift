// MainTabBarView.swift
// Copyright © RoadMap. All rights reserved.

import SwiftUI

/// Главный таб бар
struct MainTabBarView: View {
    // MARK: - Constants

    private enum Constants {
        static var emptyText = ""
        static var houseText = "house"
        static var basketText = "basket"
        static var personText = "person"
        static var gearshapeText = "gearshape"
        static var ellipsisText = "ellipsis"
        static var zeroNumber = 0
        static var houseTagNumber = 0
        static var basketTagNumber = 1
        static var personTagNumber = 2
        static var gearshapeTagNumber = 3
        static var ellipsisTagNumber = 4
    }

    // MARK: - Public Properties

    var body: some View {
        TabView(selection: $selectionViewNumber) {
            DetailView()
                .tabItem {
                    Label(Constants.emptyText, systemImage: Constants.houseText)
                }
                .tag(Constants.houseTagNumber)
            ProductsView()
                .tabItem {
                    Label(Constants.emptyText, systemImage: Constants.basketText)
                }
                .tag(Constants.basketTagNumber)
            ProfileView()
                .tabItem {
                    Label(Constants.emptyText, systemImage: Constants.personText)
                }
                .tag(Constants.personTagNumber)
            Text(Constants.emptyText)
                .tabItem {
                    Label(Constants.emptyText, systemImage: Constants.gearshapeText)
                }
                .tag(Constants.gearshapeTagNumber)
            Text(Constants.emptyText)
                .tabItem {
                    Label(Constants.emptyText, systemImage: Constants.ellipsisText)
                }
                .tag(Constants.ellipsisTagNumber)
        }
        .accentColor(.orange)
    }

    // MARK: - Private Properties

    @State private var selectionViewNumber = Constants.zeroNumber
}

struct MainTabBarView_Previews: PreviewProvider {
    static var previews: some View {
        MainTabBarView()
    }
}
