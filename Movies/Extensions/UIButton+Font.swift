//
//  UIButton+Font.swift
//  Movies
//
//  Created by Mina Maged on 07/02/2025.
//

import UIKit

extension UIButton {
    override open func awakeFromNib() {
        super.awakeFromNib()
        replaceFont()
    }
    
    private func replaceFont() {
        if let currentFont = self.titleLabel?.font {
            self.titleLabel?.font = UIFont(name: AppFont.accentFont, size: currentFont.pointSize)
        }
    }
}
