//
//  DishCollectionViewCell.swift
//  FoodApp
//
//  Created by Utku Güzel on 22.07.2023.
//

import UIKit
import Kingfisher

class DishCollectionViewCell: UICollectionViewCell {
    
    static let identifier = "DishCollectionViewCell"

    @IBOutlet weak var titleLabel: UILabel!
    @IBOutlet weak var dishImageView: UIImageView!
    @IBOutlet weak var caloriesLabel: UILabel!
    @IBOutlet weak var descriptionLabel: UILabel!
    
    func setup(dish: Dish) {
        titleLabel.text = dish.name
        dishImageView.kf.setImage(with: dish.image?.asUrl)
        caloriesLabel.text = dish.formattedCalories
        descriptionLabel.text = dish.description
        
    }
    
    
}
