//
//  AllDishes.swift
//  FoodApp
//
//  Created by Utku Güzel on 23.07.2023.
//

import Foundation


struct AllDishes: Codable {
    let categories: [DishCategory]?
    let populars: [Dish]?
    let specials: [Dish]?
}
