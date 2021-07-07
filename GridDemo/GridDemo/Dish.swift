//
//  Dish.swift
//  GridDemo
//
//  Created by Subhra Roy on 07/07/21.
//

import Foundation

struct Dish: Identifiable {
    let id: String = UUID().uuidString
    let name: String
    let price: Double
    let imgUrl: String
}

extension Dish{
    static func allDishes() -> Array<Dish>{
        return [
            Dish(name: "Filet Mignon", price: 35, imgUrl: "e1"),
            Dish(name: "Spagetti Meatballs", price: 12, imgUrl: "e2"),
            Dish(name: "Sushi", price: 15, imgUrl: "a1"),
            Dish(name: "Chocolate Cake", price: 8, imgUrl: "d1"),
            Dish(name: "Lemon Cake", price: 10, imgUrl: "d2"),
        ]
    }
}
