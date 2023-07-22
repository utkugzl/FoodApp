//
//  String+Extension.swift
//  FoodApp
//
//  Created by Utku Güzel on 22.07.2023.
//

import Foundation


extension String {
    var asUrl: URL? {
        return URL(string: self)
    }
}
