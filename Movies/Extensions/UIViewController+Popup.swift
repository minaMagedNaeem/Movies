//
//  UIViewController+Popup.swift
//  Movies
//
//  Created by Mina Maged on 07/02/2025.
//

import UIKit

extension UIViewController {
    func showErrorPopup(message: String) {
        let alert = UIAlertController(title: "Error", message: message, preferredStyle: .alert)
        alert.addAction(UIAlertAction(title: "OK", style: .default, handler: nil))
        present(alert, animated: true, completion: nil)
    }
}
