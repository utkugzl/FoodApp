//
//  CardView.swift
//  FoodApp
//
//  Created by Utku Güzel on 22.07.2023.
//

import UIKit

class CardView: UIView {
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        initialSetup()
    }
    
    required init?(coder: NSCoder) {
        super.init(coder: coder)
        initialSetup()
        
    }
    
    
    private func initialSetup() {
        layer.shadowColor = UIColor.black.cgColor
        layer.shadowOffset = .zero
        layer.cornerRadius = 10
        layer.shadowOpacity = 0.5
        layer.shadowRadius = 20
        layer.backgroundColor = UIColor(named: "mainColor2")?.cgColor
        
        cornerRadius = 10
    }
    
}
