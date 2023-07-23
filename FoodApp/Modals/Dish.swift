//
//  Dish.swift
//  FoodApp
//
//  Created by Utku Güzel on 22.07.2023.
//

import Foundation


struct Dish: Codable {
    let id: String?
    let name: String?
    let description: String?
    let image: String?
    let calories: Int?
    
    var formattedCalories: String {
        return "\(calories ?? 0) Cal"
    }
    
}
