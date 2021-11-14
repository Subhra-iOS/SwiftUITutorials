//
//  Coffee.swift
//  CoffeeOrderDemo
//
//  Created by Subhra Roy on 14/11/21.
//

import Foundation

struct Coffee {
    let name: String
    let imageUrl: String
    let price: Double
}

extension Coffee{
    static func allTypes() -> [Coffee]{
        
        return [Coffee(name: "Cappuccino", imageUrl: "Cappuccino", price: 2.5),
                Coffee(name: "Espresso", imageUrl: "Espresso", price: 2.0),
                Coffee(name: "Regular", imageUrl: "Regular", price: 1.5)]
    }
}
