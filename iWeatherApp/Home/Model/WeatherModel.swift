//
//  WeatherModel.swift
//  iWeatherApp
//
//  Created by Swelen Poliana Cesario Ebert on 11/08/22.
//

import Foundation

public struct WeatherModel: Codable {
    var dt: Int
    var temp: Double
    var minTemp: Double
    var maxTemp: Double
    var weatherId: Int
    var weatherDescription: String
    var weatherIcon: String
    var cityName: String

    var conditionImage: String {
        switch weatherId {
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

    enum Codinkeys: String, CodingKey {
       
        case dt
        case temp
        case minTemp = "temp_min"
        case maxTemp = "temp_max"
        case weatherId = "id"
        case weatherDescription = "description"
        case weatherIcon = "icon"
        case cityName = "name"

    }
}


