//
//  CurrentWeatherData.swift
//  WeatherMap
//
//  Created by Andrey on 05.04.2020.
//  Copyright © 2020 Andrey. All rights reserved.
//

import Foundation

struct CurrentWeatherData: Decodable {
    let name: String
    let main: Main
    let weather: [Weather]
}

struct Main: Decodable {
    let temp: Double
    let feelsLike: Double
    
    enum CodingKeys: String, CodingKey {
        case temp
        case feelsLike = "feels_like"
        
    }
}

struct Weather: Decodable {
    let id: Int
}
