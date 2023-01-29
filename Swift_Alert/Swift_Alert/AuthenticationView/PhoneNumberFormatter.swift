// PhoneNumberFormatter.swift
// Copyright © RoadMap. All rights reserved.

import Foundation

/// Маска на номер телефона
final class PhoneNumberFormatter: Formatter {
    // MARK: - Public Methods

    override func string(for obj: Any?) -> String? {
        guard let string = obj as? String else {
            return nil
        }
        return string.phoneFromat()
    }

    override func getObjectValue(
        _ obj: AutoreleasingUnsafeMutablePointer<AnyObject?>?,
        for string: String,
        errorDescription _: AutoreleasingUnsafeMutablePointer<NSString?>?
    ) -> Bool {
        obj?.pointee = string.phoneFromat() as AnyObject
        return true
    }
}
