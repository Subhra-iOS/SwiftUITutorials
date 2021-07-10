//
//  WeatherService.swift
//  WeatherDemo
//
//  Created by Subhra Roy on 10/07/21.
//

import Foundation

struct WeatherService {
    func getWeather(by city: String, completion: @escaping (Weather?) -> ()) -> Void{
        guard let url = URL(string: "https://api.openweathermap.org/data/2.5/weather?q=\(city)&appid=b8191fd59e35e50a52e235bb42824cba&units=imperial") else {
            completion(nil)
            return
        }
        
        URLSession.shared.dataTask(with: url) { (data, response, error) in
            guard let data = data, error == nil else {
                completion(nil)
                return
            }
            if let response: WeatherResponse = try? GenericJsonDecoder.decode(WeatherResponse.self, data), let weather = response.main{
                completion(weather)
            }else{
                completion(nil)
            }
        }.resume()
        
    }
}
