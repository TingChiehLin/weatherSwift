//
//  Weather.swift
//  Weather App
//
//  Created by Lin Ting Chieh on 2020/4/12.
//  Copyright © 2020 Lin Ting Chieh. All rights reserved.
//

import Foundation

//Match root with Main
struct WeatherResponse: Decodable {
    let main: Weather
    
}

//Data
struct Weather: Decodable {
    var temp: Double?
    var humidity: Double?
}
