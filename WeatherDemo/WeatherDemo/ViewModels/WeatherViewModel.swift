//
//  WeatherViewModel.swift
//  WeatherDemo
//
//  Created by Subhra Roy on 10/07/21.
//

import Foundation
import Combine

class WeatherViewModel: ObservableObject {
    private var weatherService: WeatherService!
    var cityName: String = ""
    @Published var weather: Weather?
    
    init(service: WeatherService) {
        self.weatherService = service
    }
    
    var temperature: String {
        if let temp = self.weather?.temp{
            return String(format: "%.0f", temp)
        }else{
            return ""
        }
    }
    
    var humidity: String {
        if let humidity = self.weather?.humidity{
            return String(format: "%.0f", humidity)
        }else{
            return ""
        }
    }
    
    private func fetchWeather(by city: String){
        self.weatherService.getWeather(by: city){ weather in
            if let currentWeather = weather{
                DispatchQueue.main.async { [weak self] in
                    self?.weather = currentWeather
                }
            }
        }
    }
    
    func search(){
        if let city = self.cityName.addingPercentEncoding(withAllowedCharacters: .urlHostAllowed){
            self.fetchWeather(by: city)
        }
    }
}
