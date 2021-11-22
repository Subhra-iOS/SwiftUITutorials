//
//  Order.swift
//  CoffeeOrderDemo
//
//  Created by Subhra Roy on 14/11/21.
//

import Foundation

struct Order: Codable{
    let name: String
    let size: String
    let coffeeName: String
    let total: Double
}
