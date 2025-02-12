//
//  Date+String.swift
//  Movies
//
//  Created by Mina Maged on 07/02/2025.
//

import Foundation

extension Date {
    init?(from rawDate: String?) {
        
        guard let rawDate = rawDate else {return nil}
        
        let dateFormatter = DateFormatter()
        dateFormatter.dateFormat = "yyyy-MM-dd"
        dateFormatter.locale = Locale(identifier: "en_US_POSIX")
        dateFormatter.timeZone = TimeZone(secondsFromGMT: 0)
        
        if let date = dateFormatter.date(from: rawDate) {
            self = date
        } else {
            return nil
        }
    }
}
