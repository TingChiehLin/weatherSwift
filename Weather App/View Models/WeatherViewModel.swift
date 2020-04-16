//
//  WeatherViewModel.swift
//  Weather App
//
//  Created by Lin Ting Chieh on 2020/4/12.
//  Copyright © 2020 Lin Ting Chieh. All rights reserved.
//

import Foundation
import Combine

class WeatherViewModel: ObservableObject {
    
    private var weatherService: WeatherService!
    
    @Published var weather = Weather()
    
    init() {
        self.weatherService = WeatherService()
    }
    
    var humidity: String {
        if let humidity = self.weather.humidity {
            return String(format: "%.0f")
        } else {
            return ""
        }
    }
    
    var temperature: String {
        if let temp = self.weather.temp {
            return String(format: "%.0f",temp)
        } else {
            return ""
        }
    }
    
    var cityName: String = ""
    
    func search() {
        if let city = self.cityName.addingPercentEncoding(withAllowedCharacters: .urlHostAllowed) {
            fetchWeather(by: city)
        }
        
    }
    
    //fetch data
    private func fetchWeather(by city: String) {
        self.weatherService.getWeather(city: city) { weather in
            if let weather = weather {
                DispatchQueue.main.async {
                    self.weather = weather
                }
            }
        }
    }
}
