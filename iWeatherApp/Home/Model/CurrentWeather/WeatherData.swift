//
//  WeatherData.swift
//  iWeatherApp
//
//  Created by Swelen Poliana Cesario Ebert on 11/08/22.
//

import Foundation

public struct WeatherData: Codable {
   
    let name: String
    let timezone: Int
    let main: Main
    let weather: [Weather]
    let dt: Int
    
    var model: WeatherModel {
        return WeatherModel(conditionId: weather.first?.id ?? 0, mainDescription: weather.first?.description, icon: weather.first?.icon, currentWeather: main.temp, tempMin: main.temp_min, tempMax: main.temp_max, dt: dt, localTimezone: timezone, name: name)
    }
}

public struct Main: Codable {
    let temp: Double
    let temp_min: Double
    let temp_max: Double
}

public struct Weather: Codable {
    let main: String
    let description: String
    let icon: String
    let id: Int
}
