//
//  Order.swift
//  FoodApp
//
//  Created by Utku Güzel on 22.07.2023.
//

import Foundation


struct Order: Codable {
    let id: String?
    let name: String?
    let dish: Dish?
}
