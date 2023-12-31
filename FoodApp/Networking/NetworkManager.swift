//
//  NetworkManager.swift
//  FoodApp
//
//  Created by Utku Güzel on 23.07.2023.
//

import Foundation

struct NetworkManager {
    
    static let shared = NetworkManager()
    
    private init() {}
    
    func fetchAllCategories(completion: @escaping (Result<AllDishes,Error>) -> Void) {
        request(route: .fetchAlCategories, method: .get, completion: completion)
    }
    
    func placeOrder(dishID: String, name: String, completion: @escaping (Result<Order,Error>) -> Void) {
        let params = ["name" : name]
        request(route: .placeOrder(dishID), method: .post, parameters: params, completion: completion)
    }
    
    func fetchCategoryDishes(categoryID: String, completion: @escaping (Result<[Dish],Error>) -> Void) {
        request(route: .fetchCategoryDishes(categoryID), method: .get, completion: completion)
    }
    
    
    func fetchOrders(completion: @escaping (Result<[Order],Error>) -> Void) {
        request(route: .fetchOrders, method: .get, completion: completion)
    }
    
    
    private func request<T: Codable>(route: Route, method: Method, parameters: [String: Any]? = nil, completion: @escaping (Result<T,Error>) -> Void) {
        
        guard let request = createRequest(route: route, method: method, parameters: parameters) else { completion(.failure(AppError.unknownError))
            return
        }
        
        let task = URLSession.shared.dataTask(with: request) { data, response, error in
            var result: Result<Data,Error>?
            if let data = data {
                result = .success(data)
                
            } else if let error = error {
                result = .failure(error)
            }
            
            DispatchQueue.main.async {
                self.handleResponse(result: result, completion: completion)
            }

            }
        
        task.resume()

    }
    
    
    private func handleResponse<T: Codable>(result: Result<Data,Error>?, completion: (Result<T,Error>) -> Void) {
        
        guard let result = result else { return }
        
        switch result {
        case .success(let data):
            let decoder = JSONDecoder()
            guard let response = try? decoder.decode(ApiResponse<T>.self, from: data) else { completion(.failure(AppError.errorDecoding))
                return
            }
            if let error = response.error {
                completion(.failure(AppError.serverError(error)))
                return
            }
            if let decodedData = response.data {
                completion(.success(decodedData))
            } else {
                completion(.failure(AppError.unknownError))
            }
        case .failure(let error):
            completion(.failure(error))
        }
        
    }
    
    
     private func createRequest(route: Route, method: Method, parameters: [String: Any]? = nil) -> URLRequest? {
        
        let urlString = Route.baseUrl + route.description
        guard let url = urlString.asUrl else { return nil }
        var urlRequest = URLRequest(url: url)
        urlRequest.addValue("application/json", forHTTPHeaderField: "Content-Type")
        urlRequest.httpMethod = method.rawValue
        
        if let params = parameters {
            switch method {
            case .get:
                var urlComponent = URLComponents(string: urlString)
                urlComponent?.queryItems = params.map { URLQueryItem(name: $0, value: "\($1)") }
                urlRequest.url = urlComponent?.url
            case .post, .delete, .patch:
                let bodyData = try? JSONSerialization.data(withJSONObject: params, options: [])
                urlRequest.httpBody = bodyData

            }
        }
        
        return urlRequest
        
    }
    
}
