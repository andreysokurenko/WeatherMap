//
//  CurrentWeather.swift
//  WeatherMap
//
//  Created by Andrey on 05.04.2020.
//  Copyright © 2020 Andrey. All rights reserved.
//

import Foundation

struct CurrentWeather {
    let cityName: String
    let temperature: Double
    let feelLiketemperature: Double
    let conditionCode: Int
    var temperatureString: String {
        return String(format: "%.0f", temperature)
    }
    var feelLiketemperatureString: String {
        return String(format: "%.0f", feelLiketemperature)
    }
    
    var systemIconNameString: String {
        switch conditionCode {
        case 200...232: return "cloud.bolt.rain.fill"
        case 300...321: return "cloud.drizzle.fill"
        case 500...531: return "cloud.rain.fill"
        case 600...622: return "cloud.snow.fill"
        case 701...781: return "smoke.fill"
        case 800: return "sun.min.fill"
        case 801...804: return "cloud.fill"
        default: return "nosign"
        }
    }
    
    init?(currentWeatherData: CurrentWeatherData) {
        cityName = currentWeatherData.name
        temperature = currentWeatherData.main.temp
        feelLiketemperature = currentWeatherData.main.feelsLike
        conditionCode = currentWeatherData.weather.first!.id
    }
}
