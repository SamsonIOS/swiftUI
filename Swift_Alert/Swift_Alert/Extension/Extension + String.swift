// Extension + String.swift
// Copyright © RoadMap. All rights reserved.

import Foundation

/// Расширения для String
extension String {
    // MARK: - Private Constants

    private enum Constants {
        static let emptyText = ""
        static let spacingText: Character = " "
        static let rangeText = "[^0-9]"
        static let maskNumberText = "+X-(XXX)-XXX-XX-XX"
        static let cardFormat = "XXXX-XXXX-XXXX-XXXX"
        static let sevenPlusText: String = "+7"
        static let sevenText: Character = "7"
        static let elementText: Character = "X"
    }

    // MARK: - Public Methods

    func makeNumberString() -> String {
        replacingOccurrences(of: Constants.rangeText, with: Constants.emptyText, options: .regularExpression)
    }

    func removeAllSpace() -> String {
        replacingOccurrences(of: " ", with: Constants.emptyText)
    }

    func formatPhone(with mask: String) -> String {
        let numbers = removeAllSpace().makeNumberString()
        var result = Constants.emptyText
        var index = numbers.startIndex
        for ch in mask.enumerated() where index < numbers.endIndex {
            if ch.element == Constants.elementText {
                if !result.contains(Constants.sevenPlusText), numbers.first != Constants.sevenText {
                    result.append(Constants.sevenText)
                }
                result.append(numbers[index])
                index = numbers.index(after: index)
            } else {
                result.append(ch.element)
            }
        }
        return result
    }

    func formatCardNumber(with mask: String) -> String {
        let numbers = removeAllSpace().makeNumberString()
        var result = Constants.emptyText
        var index = numbers.startIndex
        for ch in mask.enumerated() where index < numbers.endIndex {
            if ch.element == Character("X") {
                result.append(numbers[index])
                index = numbers.index(after: index)
            } else {
                result.append(ch.element)
            }
        }
        return result
    }

    func phoneFromat() -> String {
        formatPhone(with: Constants.maskNumberText)
    }

    func cardFormat() -> String {
        formatCardNumber(with: Constants.cardFormat)
    }
}
