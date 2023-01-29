// NotficationsViewModel.swift
// Copyright © RoadMap. All rights reserved.

import SwiftUI

/// Вью модель экрана с настройками уведомлений
final class NotificationsViewModel: ObservableObject {
    // MARK: - Constants

    private enum Constants {
        static var productText = "Product updates"
        static var commentsText = "Comments"
        static var offerText = "Offer updates"
        static var notificationsText = "Notifications"
        static var productDescriptionText = "Stair lifts free the freedom of your home"
        static var commentsDescriptionText = "Advertising relationships vs business"
        static var offerDescriptionText = "A right media mix can make"
        static var notificationsDescriptionText = "Creating remarkable poster prints"
    }

    // MARK: - Public Properties

    @Published var settings: [Setting] = [
        Setting(title: Constants.productText, description: Constants.productDescriptionText, isOn: false),
        Setting(title: Constants.commentsText, description: Constants.commentsDescriptionText, isOn: false),
        Setting(title: Constants.offerText, description: Constants.offerDescriptionText, isOn: false),
        Setting(title: Constants.notificationsText, description: Constants.notificationsDescriptionText, isOn: false)
    ]
}
