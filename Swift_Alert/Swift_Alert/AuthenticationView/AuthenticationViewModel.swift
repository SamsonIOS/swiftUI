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
        guard totalChars.count <= Constants.phoneNumber else {
            return lastNumberText
        }
        lastNumberText = totalChars
        return lastNumberText
    }

    func checkPhoneNumberCount(totalChars: String) -> Bool {
        totalChars.count == Constants.phoneNumber
    }

    func passwordText(totalChars: String) -> String {
        guard totalChars.count <= Constants.maxPasswordNumber else {
            return lastPasswordText
        }
        lastPasswordText = totalChars
        return lastPasswordText
    }

    func progressViewActivate(completion: @escaping (String) -> Void) {
        Timer.scheduledTimer(withTimeInterval: Constants.timeInterval, repeats: true, block: { timer in
            guard self.progressViewCount == Constants.progressMaxCount else {
                self.progressViewCount = Constants.zeroNumber
                return
            }
            timer.invalidate()
            self.progressViewCount = Constants.zeroNumber
            guard
                Constants.minPasswordNumber ... Constants.maxPasswordNumber ~= self.passwordText.count,
                self.lastNumberText.count == Constants.phoneNumber
            else {
                completion(Constants.emptyText)
                return
            }
            completion(Constants.detailViewTagText)
        })
    }
}
