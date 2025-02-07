//
//  UIView+Indicator.swift
//  Movies
//
//  Created by Mina Maged on 07/02/2025.
//

import UIKit
import NVActivityIndicatorView

extension UIView {
    
    func startProgressAnim() {
        let activityIndicatorView = NVActivityIndicatorView(frame: CGRect(x: 0, y: 0, width: 50, height: 50), type: .circleStrokeSpin)
        activityIndicatorView.color = AppColors.primary
        self.addSubview(activityIndicatorView)
        self.bringSubviewToFront(activityIndicatorView)
        
        activityIndicatorView.translatesAutoresizingMaskIntoConstraints = false
        
        activityIndicatorView.centerXAnchor.constraint(equalTo: self.centerXAnchor).isActive = true
        activityIndicatorView.centerYAnchor.constraint(equalTo: self.centerYAnchor).isActive = true
        
        activityIndicatorView.startAnimating()
    }
    
    func stopProgressAnim() {
        for view in self.subviews {
            if let activityView = view as? NVActivityIndicatorView {
                activityView.stopAnimating()
                activityView.removeFromSuperview()
                break
            }
        }
    }
    
    
    func pinEdgesToSuperviewBounds(margin: CGFloat = 0) {
        guard let superview = self.superview else {
            print("Error! `superview` was nil – call `addSubview(view: UIView)` before calling `pinEdgesToSuperviewBounds()` to fix this.")
            return
        }
        
        self.translatesAutoresizingMaskIntoConstraints = false
        self.topAnchor.constraint(equalTo: superview.topAnchor, constant: margin).isActive = true
        self.bottomAnchor.constraint(equalTo: superview.bottomAnchor, constant: -margin).isActive = true
        self.leadingAnchor.constraint(equalTo: superview.leadingAnchor, constant: margin).isActive = true
        self.trailingAnchor.constraint(equalTo: superview.trailingAnchor, constant: -margin).isActive = true
        
    }
    
    @IBInspectable
    var CornerRadius: CGFloat {
        get {
            return layer.cornerRadius
        }
        set {
            layer.cornerRadius = newValue
        }
    }
    
    @IBInspectable
    var borderWidth: CGFloat {
        get {
            return layer.borderWidth
        }
        set {
            layer.borderWidth = newValue
        }
    }
    
    @IBInspectable
    var BorderColor: UIColor? {
        get {
            if let color = layer.borderColor {
                return UIColor(cgColor: color)
            }
            return nil
        }
        set {
            if let color = newValue {
                layer.borderColor = color.cgColor
            } else {
                layer.borderColor = nil
            }
        }
    }
    
    @IBInspectable
    var shadowRadius: CGFloat {
        get {
            return layer.shadowRadius
        }
        set {
            layer.shadowRadius = newValue
        }
    }
    
    @IBInspectable
    var shadowOpacity: Float {
        get {
            return layer.shadowOpacity
        }
        set {
            layer.shadowOpacity = newValue
        }
    }
    
    @IBInspectable
    var shadowOffset: CGSize {
        get {
            return layer.shadowOffset
        }
        set {
            layer.shadowOffset = newValue
        }
    }
    
    @IBInspectable
    var shadowColor: UIColor? {
        get {
            if let color = layer.shadowColor {
                return UIColor(cgColor: color)
            }
            return nil
        }
        set {
            if let color = newValue {
                layer.shadowColor = color.cgColor
            } else {
                layer.shadowColor = nil
            }
        }
    }
}
