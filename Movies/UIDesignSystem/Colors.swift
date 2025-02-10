//
//  Colors.swift
//  Movies
//
//  Created by Mina Maged on 07/02/2025.
//
import UIKit

struct AppColors {
    static let primary = AppColors.hex("#FF4500") // Orange Red
    static let background = AppColors.hex("#1E1E1E") // Dark Gray
    static let cardBackground = AppColors.hex("#2C2C2C") // Lighter Gray
    static let text = AppColors.hex("#FFFFFF") // White
    static let accent = AppColors.hex("#FFD700") // Gold

    private static func hex(_ hex: String, alpha: CGFloat = 1.0) -> UIColor {
        var hexSanitized = hex.trimmingCharacters(in: .whitespacesAndNewlines).uppercased()

        if hexSanitized.hasPrefix("#") {
            hexSanitized.remove(at: hexSanitized.startIndex)
        }

        guard hexSanitized.count == 6 else {
            return UIColor.gray
        }

        var rgb: UInt64 = 0
        Scanner(string: hexSanitized).scanHexInt64(&rgb)

        return UIColor(
            red: CGFloat((rgb >> 16) & 0xFF) / 255.0,
            green: CGFloat((rgb >> 8) & 0xFF) / 255.0,
            blue: CGFloat(rgb & 0xFF) / 255.0,
            alpha: alpha
        )
    }
}
