//
//  Firebase+Extension.swift
//  Car-sharing-ios
//
//  Created by Evan Beh on 16/09/2021.
//

import UIKit

import Firebase

extension DataSnapshot {
    var data: Data? {
        guard let value = value, !(value is NSNull) else { return nil }
        return try? JSONSerialization.data(withJSONObject: value)
    }
    var json: String? { data?.string }
}
extension Data {
    var string: String? { String(data: self, encoding: .utf8) }
}
