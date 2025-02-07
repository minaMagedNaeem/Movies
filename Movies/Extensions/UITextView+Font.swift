//
//  UITextView+UI.swift
//  Movies
//
//  Created by Mina Maged on 07/02/2025.
//

import UIKit

extension UITextView {
    override open func awakeFromNib() {
        super.awakeFromNib()
        replaceFont()
    }
    
    private func replaceFont() {
        if let currentFont = self.font {
            self.font = UIFont(name: AppFont.bodyFont, size: currentFont.pointSize)
        }
    }
}
