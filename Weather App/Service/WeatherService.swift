//
//  WeatherService.swift
//  Weather App
//
//  Created by Lin Ting Chieh on 2020/4/12.
//  Copyright © 2020 Lin Ting Chieh. All rights reserved.
//

import Foundation

class WeatherService {
    func getWeather(city: String, completion: @escaping (Weather?) -> ()){
        guard let url = URL(string:
            "http://api.openweathermap.org/data/2.5/weather?q=\(city)&appid=cf301ca20db80baafb28fee8d8d13a95")
            else {
                completion(nil)
                return
        }
        URLSession.shared.dataTask(with: url) { data, response, error in
            guard let data = data, error == nil else {
                completion(nil)
                return
            }
            
            let weatherResponse = try? JSONDecoder().decode(WeatherResponse.self, from: data)
            if let weatherResponse = weatherResponse {
                let weather = weatherResponse.main
                completion(weather)
            } else {
                completion(nil)
            }
        }.resume()
    }
}
