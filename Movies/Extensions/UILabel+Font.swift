//
//  UILabel+UI.swift
//  Movies
//
//  Created by Mina Maged on 07/02/2025.
//

import UIKit

extension UILabel {
    override open func awakeFromNib() {
        super.awakeFromNib()
        replaceFont()
    }
    
    private func replaceFont() {
        if let currentFont = self.font {
            switch currentFont.fontName {
            case "System-Bold", ".SFUI-Bold":
                self.font = UIFont(name: AppFont.titleFont, size: currentFont.pointSize)
            case "System-Light", ".SFUI-Light":
                self.font = UIFont(name: AppFont.bodyFont, size: currentFont.pointSize)
            default:
                self.font = UIFont(name: AppFont.accentFont, size: currentFont.pointSize)
            }
        }
    }
}
