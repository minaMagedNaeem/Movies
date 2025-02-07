//
//  AccessToken.swift
//  Movies
//
//  Created by Mina Maged on 07/02/2025.
//
import Foundation

class AccessToken {
    static func getAPIKey() -> String? {
        if let path = Bundle.main.path(forResource: "Secrets", ofType: "plist"),
           let dict = NSDictionary(contentsOfFile: path),
           let encodedKey = dict["APIKey"] as? String,
           let data = Data(base64Encoded: encodedKey),
           let key = String(data: data, encoding: .utf8) {
            return key
        }
        return nil
    }
}
