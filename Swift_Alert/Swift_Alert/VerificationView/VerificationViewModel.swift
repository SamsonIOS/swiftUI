// VerificationViewModel.swift
// Copyright © RoadMap. All rights reserved.

import SwiftUI

/// Вью модель экрана аутентификации
final class VerificationViewModel: ObservableObject {
    // MARK: - Constants

    private enum Constants {
        static var emptyText = ""
        static var emptyTupleText = ("", "", "", "")
        static var smsMaxNumber = 1
        static var progressMaxCount = 10
        static var nineNumber = 9
        static var oneNumber = 1
        static var zeroNumber = 0
        static var timeInterval = 0.5
    }

    // MARK: - Public Properties

    @Published var smsNumberText = Constants.emptyText
    @Published var randomNumberText = Constants.emptyText
    @Published var randomTupleText = Constants.emptyTupleText
    @Published var progressViewCount = Constants.zeroNumber

    // MARK: - Public Methods

    func smsText(totalChars: String) -> String {
        if totalChars.count <= Constants.smsMaxNumber {
            smsNumberText = totalChars
            return smsNumberText
        } else {
            return smsNumberText
        }
    }

    func progressViewActivate() {
        Timer.scheduledTimer(withTimeInterval: Constants.timeInterval, repeats: true, block: { timer in
            if self.progressViewCount == Constants.progressMaxCount {
                timer.invalidate()
            } else {
                self.progressViewCount += Constants.oneNumber
            }
        })
    }

    func getRandomNumber() {
        randomTupleText = (
            String(Int.random(in: Constants.zeroNumber ... Constants.nineNumber)),
            String(Int.random(in: Constants.zeroNumber ... Constants.nineNumber)),
            String(Int.random(in: Constants.zeroNumber ... Constants.nineNumber)),
            String(Int.random(in: Constants.zeroNumber ... Constants.nineNumber))
        )
        randomNumberText =
            "\(randomTupleText.0)\(randomTupleText.1)\(randomTupleText.2)\(randomTupleText.3)"
    }
}
