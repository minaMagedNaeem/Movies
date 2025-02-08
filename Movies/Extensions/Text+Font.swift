//
//  Text+Font.swift
//  Movies
//
//  Created by Mina Maged on 08/02/2025.
//
import SwiftUI

extension Text {
    func titleFont() -> Text {
        self.font(.custom(AppFont.titleFont, size: 24))
    }

    func accentFont() -> Text {
        self.font(.custom(AppFont.accentFont, size: 18))
    }
}
