//
//  UINavigationController+Designs.swift
//  Movies
//
//  Created by Mina Maged on 08/02/2025.
//
import UIKit

extension UINavigationController {
    func styleNavBar() {
        let appearance = UINavigationBarAppearance()
        appearance.configureWithOpaqueBackground()
        appearance.backgroundColor = AppColors.background
        appearance.titleTextAttributes = [.foregroundColor: AppColors.text]
        
        appearance.backButtonAppearance.normal.titleTextAttributes = [.foregroundColor: AppColors.accent]
        
        UINavigationBar.appearance().tintColor = AppColors.accent
        UINavigationBar.appearance().scrollEdgeAppearance = appearance
        UINavigationBar.appearance().standardAppearance = appearance
        UINavigationBar.appearance().compactAppearance = appearance
    }
}
