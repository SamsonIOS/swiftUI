// AuthenticationViewModel.swift
// Copyright © RoadMap. All rights reserved.

import SwiftUI

/// Вью модель экрана аутентификации
final class AuthenticationViewModel: ObservableObject {
    // MARK: - Constants

    private enum Constants {
        static let detailViewTagText = "DetailView"
        static let emptyText = ""
        static let minPasswordNumber = 6
        static let maxPasswordNumber = 15
        static let phoneNumber = 18
        static let progressMaxCount = 10
        static let timeInterval = 0.3
        static let zeroNumber = 0
        static let oneNumber = 1
        static let startScale: CGFloat = 0
    }

    // MARK: - Public Properties

    @Published var lastPasswordText = Constants.emptyText
    @Published var passwordText = ""
    @Published var lastNumberText = Constants.emptyText
    @Published var phoneNumberFormatter = PhoneNumberFormatter()
    @Published var progressViewCount = Constants.zeroNumber
    @Published var phoneNumberText = ""
    @Published var isAlertShown = false
    @Published var selectionViewText: String?
    @Published var scaleLogInSignUpViewNumber = Constants.startScale
    @Published var scaleNumberTextEditorViewNumber = Constants.startScale
    @Published var scalePasswordTextEditorViewNumber = Constants.startScale
    @Published var scaleProgressViewNumber = Constants.startScale
    @Published var scaleSignUpTextViewNumber = Constants.startScale
    @Published var scaleCheckTextViewNumber = Constants.startScale
    @Published var scaleForgotPasswordButtonViewNumber = Constants.startScale
    @Published var isPasswordViewAnimate = false
    @Published var isXmarkShown = false

    // MARK: - Public Methods

    func phoneNumberText(totalChars: String) -> String {
        if totalChars.count <= Constants.phoneNumber {
            lastNumberText = totalChars.phoneFromat()
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

    func progressViewActivate(completion: @escaping (String) -> Void) {
        Timer.scheduledTimer(withTimeInterval: Constants.timeInterval, repeats: true, block: { timer in
            if self.progressViewCount == Constants.progressMaxCount {
                timer.invalidate()
                self.progressViewCount = Constants.zeroNumber
                if
                    Constants.minPasswordNumber ... Constants.maxPasswordNumber ~= self.passwordText.count,
                    self.lastNumberText.count == Constants.phoneNumber
                {
                    completion(Constants.detailViewTagText)
                } else {
                    completion(Constants.emptyText)
                }
            } else {
                self.progressViewCount += Constants.oneNumber
            }
        })
    }
}
