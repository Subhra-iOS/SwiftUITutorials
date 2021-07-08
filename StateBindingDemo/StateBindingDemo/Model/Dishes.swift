//
//  Dishes.swift
//  StateBindingDemo
//
//  Created by Subhra Roy on 08/07/21.
//

import Foundation

struct Dishes: Identifiable {
    let id: String = UUID().uuidString
    let name: String
    let imageUrl: String
    let isSpiecy: Bool
}

extension Dishes{
    static func all() -> [Dishes]{
        return [Dishes(name: "Kung pow chicken", imageUrl: "kungpow", isSpiecy: true),
                Dishes(name: "Spicy and garlic chicken", imageUrl: "spicy", isSpiecy: true),
                Dishes(name: "Sweet and sour chicken", imageUrl: "sweet", isSpiecy: false)]
    }
}
