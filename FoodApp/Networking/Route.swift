//
//  Route.swift
//  FoodApp
//
//  Created by Utku Güzel on 23.07.2023.
//

import Foundation


enum Route {
    static let baseUrl = "https://yummie.glitch.me"
    
    case fetchAlCategories
    case placeOrder(String)
    case fetchCategoryDishes(String)
    case fetchOrders
    
    var description: String {
        switch self {
            
        case .fetchAlCategories:
            return "/dish-categories"
        case .placeOrder(let dishID):
            return "/orders/\(dishID)"
        case .fetchCategoryDishes(let categoryID):
            return "/dishes/\(categoryID)"
        case .fetchOrders:
            return "/orders"
        }
    }
}
