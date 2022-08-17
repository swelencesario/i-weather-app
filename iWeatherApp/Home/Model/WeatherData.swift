//
//  WeatherData.swift
//  iWeatherApp
//
//  Created by Swelen Poliana Cesario Ebert on 11/08/22.
//

import Foundation

public struct WeatherData: Codable {
   
    var list: [WeatherModel]
    var city: City
    
}

public struct List: Codable {
    var dt: Int
    var main: Main
    var weather: [Weather]
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

