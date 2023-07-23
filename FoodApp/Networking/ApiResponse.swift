//
//  ApiResponse.swift
//  FoodApp
//
//  Created by Utku Güzel on 23.07.2023.
//

import Foundation

struct ApiResponse<T:Codable>: Codable {
    let status: Int
    let message: String?
    let data: T?
    let error: String?
    
    
}
