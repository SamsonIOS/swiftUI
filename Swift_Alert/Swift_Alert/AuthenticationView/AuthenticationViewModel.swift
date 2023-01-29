// AuthenticationViewModel.swift
// Copyright © RoadMap. All rights reserved.

import SwiftUI

/// Вью модель экрана аутентификации
final class AuthenticationViewModel: ObservableObject {
    // MARK: - Constants

    private enum Constants {
        static var detailViewTagText = "DetailView"
        static var emptyText = ""
        static var minPasswordNumber = 6
        static var maxPasswordNumber = 15
        static var phoneNumber = 11
    }

    // MARK: - Public Properties

    @Published var lastPasswordText = Constants.emptyText
    @Published var lastNumberText = Constants.emptyText
    @Published var phoneNumberFormatter = PhoneNumberFormatter()

    // MARK: - Public Methods

    func phoneNumberText(totalChars: String) -> String {
        if totalChars.count <= Constants.phoneNumber {
            lastNumberText = totalChars
            return lastNumberText
        } else {
            return lastNumberText
        }
    }

    func checkPhoneNumberCount(totalChars: String) -> Bool {
        totalChars.count == Constants.phoneNumber
    }

    func passwordText(totalChars: String) -> String {
        if totalChars.count <= Constants.maxPasswordNumber {
            lastPasswordText = totalChars
            return lastPasswordText
        } else {
            return lastPasswordText
        }
    }

    func getResultUserCheck() -> String {
        if
            Constants.minPasswordNumber ... Constants.maxPasswordNumber ~= lastPasswordText.count,
            lastNumberText.count == Constants.phoneNumber
        {
            return Constants.detailViewTagText
        } else {
            return Constants.emptyText
        }
    }
}
