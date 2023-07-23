//
//  DishCategory.swift
//  FoodApp
//
//  Created by Utku Güzel on 22.07.2023.
//

import Foundation

struct DishCategory: Codable {
    let id: String?
    let name: String?
    let image: String?
    
    enum CodingKeys: String, CodingKey {
        case id
        case name = "title"
        case image
    }
}
