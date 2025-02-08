//
//  UITabBar+Designs.swift
//  Movies
//
//  Created by Mina Maged on 08/02/2025.
//

import UIKit

extension UITabBar {
    func setupAppearance() {
        let appearance = UITabBarAppearance()
        appearance.configureWithOpaqueBackground()
        appearance.backgroundColor = AppColors.background
        appearance.stackedLayoutAppearance.selected.iconColor = AppColors.primary
        appearance.stackedLayoutAppearance.selected.titleTextAttributes = [.foregroundColor: AppColors.primary]
        appearance.stackedLayoutAppearance.normal.iconColor = .gray
        appearance.stackedLayoutAppearance.normal.titleTextAttributes = [.foregroundColor: UIColor.gray]

            self.standardAppearance = appearance
            if #available(iOS 15.0, *) {
                self.scrollEdgeAppearance = appearance
            }

            self.isTranslucent = false
    }
}
