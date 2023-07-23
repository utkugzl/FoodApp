//
//  AppError.swift
//  FoodApp
//
//  Created by Utku Güzel on 23.07.2023.
//

import Foundation

enum AppError: LocalizedError {
    case errorDecoding
    case unknownError
    case invalidUrl
    case serverError(String)
    
    var errorDescription: String? {
        switch self {
            
        case .errorDecoding:
            return "Response could not be decoded"
        case .unknownError:
            return "I have no idea what go on"
        case .invalidUrl:
            return "Invalid URL"
        case .serverError(let error):
            return error
        }
    }
}
