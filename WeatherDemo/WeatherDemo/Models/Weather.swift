//
//  Weather.swift
//  WeatherDemo
//
//  Created by Subhra Roy on 10/07/21.
//

import Foundation

struct WeatherResponse: Decodable {
    let main: Weather?
}

struct Weather: Decodable {
    let temp: Double?
    let humidity: Double?
}

