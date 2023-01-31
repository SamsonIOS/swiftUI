// PaymentViewModel.swift
// Copyright © RoadMap. All rights reserved.

import SwiftUI

/// Вью модель экрана с платежной информацией
final class PaymentViewModel: ObservableObject {
    // MARK: - Constants

    private enum Constants {
        static let cardMaxNumber = 19
        static let cvvMaxNumber = 3
        static let emptyText = ""
    }

    // MARK: - Public Properties

    @Published var isCardAnimate = false
    @Published var isCardholderAnimate = false
    @Published var isValidAnimate = false
    @Published var isCvvAnimate = false
    @Published var isKeyboardShown = false
    @Published var isFrontCardShown = true
    @Published var backDegree = -90.0
    @Published var frontDegree = 0.0
    @Published var monthText = ["01", "02", "03", "04", "05", "06", "07", "08", "09", "10", "11", "12"]
    @Published var yearText = ["2023", "2024", "2025", "2026", "2027", "2028"]
    @Published var cardholderName = Constants.emptyText
    @Published var cardNumberText = Constants.emptyText
    @Published var cvvNumberText = Constants.emptyText
    @Published var isAlertShown = false

    // MARK: - Private Properties

    private var cardText = ""
    private var cvvText = ""

    // MARK: - Public Methods

    func cardText(totalChars: String) -> String {
        if totalChars.count <= 19 {
            cardText = totalChars.cardFormat()
            return cardText
        } else {
            return cardText
        }
    }

    func cvvText(totalChars: String) -> String {
        if totalChars.count <= Constants.cvvMaxNumber {
            cvvText = totalChars
            return cvvText
        } else {
            return cvvText
        }
    }

    func checkCvvNumberCount(totalChars: String) -> Bool {
        totalChars.count == Constants.cvvMaxNumber
    }

    func checkCardNumberCount(totalChars: String) -> Bool {
        totalChars.count == Constants.cardMaxNumber
    }

    func startCardAnimation() {
        withAnimation(.linear(duration: 0.1)) {
            isCardAnimate = true
        }
        withAnimation(.linear(duration: 0.1).delay(0.1)) {
            isCardAnimate = false
        }
    }

    func startCardholderAnimation() {
        withAnimation(.linear(duration: 0.1)) {
            isCardholderAnimate = true
        }
        withAnimation(.linear(duration: 0.1).delay(0.1)) {
            isCardholderAnimate = false
        }
    }

    func startValidAnimation() {
        withAnimation(.linear(duration: 0.1)) {
            isValidAnimate = true
        }
        withAnimation(.linear(duration: 0.1).delay(0.1)) {
            isValidAnimate = false
        }
    }

    func startCvvAnimation() {
        withAnimation(.linear(duration: 0.1)) {
            isCvvAnimate = true
        }
        withAnimation(.linear(duration: 0.1).delay(0.1)) {
            isCvvAnimate = false
        }
    }

    func flipCard() {
        if isFrontCardShown {
            withAnimation(.linear(duration: 0.3)) {
                backDegree = -90
            }
            withAnimation(.linear(duration: 0.3).delay(0.3)) {
                frontDegree = 0
            }
        } else {
            withAnimation(.linear(duration: 0.3)) {
                frontDegree = 90
            }
            withAnimation(.linear(duration: 0.3).delay(0.3)) {
                backDegree = 0
            }
        }
    }

    func getBackDegree() -> Double {
        backDegree
    }

    func getFrontDegree() -> Double {
        frontDegree
    }
}
