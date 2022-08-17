//
//  WeatherData.swift
//  iWeatherApp
//
//  Created by Swelen Poliana Cesario Ebert on 11/08/22.
//

import Foundation

public struct WeatherData: Codable {
   
    var list: [List]
    var city: City
   
    var model: [WeatherModel] {
        return [WeatherModel(dt: list.first?.dt ?? 0, currentWeather: list.first?.main?.temp ?? 0.0, minTemp: list.first?.main?.temp_min ?? 0.0, maxTemp: list.first?.main?.temp_max ?? 0.0, conditionId: list.first?.weather?.first?.id ?? 0, weatherDescription: list.first?.weather?.first?.description ?? "", weatherIcon: list.first?.weather?.first?.icon ?? "", localName: city.name)]
    }
}

public struct List: Codable {
    var dt: Int
    var main: Main?
    var weather: [Weather]?
}

public struct Main: Codable {
    let temp: Double
    let temp_min: Double
    let temp_max: Double
}

public struct Weather: Codable {
    let id: Int
    let main: String
    let description: String
    let icon: String
    
}

public struct City: Codable {
    let name: String
}

