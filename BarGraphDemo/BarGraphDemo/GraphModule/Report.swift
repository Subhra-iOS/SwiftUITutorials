//
//  Report.swift
//  BarGraphDemo
//
//  Created by Subhra Roy on 01/12/21.
//

import Foundation

struct Report: Hashable {
    let year: String
    let revenue: Double
}

extension Report{
    static func all() -> [Report]{
        return [
            Report(year: "2011", revenue: 2500),
            Report(year: "2012", revenue: 5500),
            Report(year: "2013", revenue: 8500)
        ]
    }
}
