//
//  UIView+Extension.swift
//  FoodApp
//
//  Created by Utku Güzel on 21.07.2023.
//

import UIKit


extension UIView {
    
    @IBInspectable var cornerRadius: CGFloat {
        get { return self.cornerRadius}
        set { self.layer.cornerRadius = newValue }
    }
    
}
