// ProfileView.swift
// Copyright © RoadMap. All rights reserved.

import SwiftUI

/// Профиль пользователя
struct ProfileView: View {
    // MARK: - Constants

    private enum Constants {
        static let mailText = "mail"
        static let imageUserName = "goodBay"
        static let userName = "Sergey G"
        static let cityUserName = "Rostov-On-Don"
        static let messagesText = "Messages"
        static let bellImageName = "bell"
        static let notificationText = "Notification"
        static let personImageName = "person"
        static let accountsDetailsText = "Accounts Details"
        static let basketImageName = "basket"
        static let myPurchasesText = "My purchases"
        static let gearshapeImageName = "gearshape"
        static let settingsText = "Settings"
        static let locationImageName = "mappin.and.ellipse"
        static let zeroNumber = 0
        static let circleFrame: CGFloat = 30
        static let imageUserFrame: CGFloat = 200
        static let forGradientViewFrame: CGFloat = 25
    }

    // MARK: - Public Properties

    var body: some View {
        NavigationView {
            VStack(spacing: 30) {
                headerBackgroundView(height: 100)
                infoUserView
                List {
                    NavigationLink {} label: {
                        menuView(
                            imageName: Constants.mailText,
                            menuName: Constants.messagesText,
                            isNotification: true,
                            countNote: 3
                        )
                    }
                    NavigationLink {
                        NotificationsView()
                    } label: {
                        menuView(
                            imageName: Constants.bellImageName,
                            menuName: Constants.notificationText,
                            isNotification: true,
                            countNote: 5
                        )
                    }
                    NavigationLink {} label: {
                        menuView(
                            imageName: Constants.personImageName,
                            menuName: Constants.accountsDetailsText,
                            isNotification: false,
                            countNote: Constants.zeroNumber
                        )
                    }
                    NavigationLink {} label: {
                        menuView(
                            imageName: Constants.basketImageName,
                            menuName: Constants.myPurchasesText,
                            isNotification: false,
                            countNote: Constants.zeroNumber
                        )
                    }
                    NavigationLink {} label: {
                        menuView(
                            imageName: Constants.gearshapeImageName,
                            menuName: Constants.settingsText,
                            isNotification: false,
                            countNote: Constants.zeroNumber
                        )
                    }
                }
                .listStyle(.plain)
            }
            .navigationBarHidden(true)
            .ignoresSafeArea()
        }
    }

    // MARK: - Private properties

    private var infoUserView: some View {
        VStack {
            Image(Constants.imageUserName)
                .resizable()
                .frame(
                    width: Constants.imageUserFrame,
                    height: Constants.imageUserFrame
                )
                .clipShape(Circle())
            Text(Constants.userName)
                .font(.title)
                .fontWeight(.bold)
            HStack {
                Image(systemName: Constants.locationImageName)
                    .foregroundColor(.red)
                Text(Constants.cityUserName)
                    .fontWeight(.light)
            }
        }
    }

    // MARK: - Private Methods

    private func numberOfNotification(countNote: Int) -> some View {
        ZStack {
            Circle()
                .fill(
                    LinearGradient(
                        colors: [Color.yellow, Color.orange],
                        startPoint: .leading,
                        endPoint: .trailing
                    )
                )
                .frame(
                    width: Constants.circleFrame,
                    height: Constants.circleFrame
                )
            Text("\(countNote)")
                .font(.title2)
                .fontWeight(.bold)
                .foregroundColor(.white)
        }
    }

    private func menuView(
        imageName: String,
        menuName: String,
        isNotification: Bool,
        countNote: Int
    ) -> some View {
        HStack {
            Image(systemName: imageName)
                .resizable()
                .frame(
                    width: Constants.forGradientViewFrame,
                    height: Constants.forGradientViewFrame
                )
                .foregroundColor(.gray)
            Text(menuName)
                .font(.title3)
                .fontWeight(.semibold)
                .foregroundColor(.black)
            Spacer()
            if isNotification {
                numberOfNotification(countNote: countNote)
            }
        }
        .frame(height: 40)
    }
}

struct ProfileView_Previews: PreviewProvider {
    static var previews: some View {
        ProfileView()
    }
}
