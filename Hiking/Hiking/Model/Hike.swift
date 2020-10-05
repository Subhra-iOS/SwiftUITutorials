//
//  Hike.swift
//  Hiking
//
//  Created by Subhra Roy on 05/10/20.
//

import Foundation

struct Hike {
    let name: String
    let imageUrl: String
    let miles: Double
}

extension Hike{
    static func all() -> [Hike]{
        return [Hike(name: "Salmonbery Trail", imageUrl: "sal", miles: 6),
                Hike(name: "Tom, Dick and Harry Mountain", imageUrl: "tom", miles: 5.8),
                 Hike(name: "Tamanawas Falls", imageUrl: "tam", miles: 5)]
    }
}
