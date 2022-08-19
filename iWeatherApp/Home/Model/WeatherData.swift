//
//  WeatherData.swift
//  iWeatherApp
//
//  Created by Swelen Poliana Cesario Ebert on 11/08/22.
//

import Foundation

public struct WeatherData: Codable {
    var list: [List]
}

public struct List: Codable {
    var dt: Int
    var main: Main
    var weather: [Weather]
    var dt_txt: String
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
    let icon: String?
    
    var conditionImage: String {
        switch id {
        case 200...299:
            return "imThunderstorm"
        case 300...399:
            return "imDrizzle"
        case 500...599:
            return "imRain"
        case 600...699:
            return "imSnow"
        case 700...799:
            return "imAtmosphere"
        case 800:
            return "imClear"
        default:
            return "imClouds"
        }
    }

}

public struct City: Codable {
    let name: String
}


