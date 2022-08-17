//
//  WeatherModel.swift
//  iWeatherApp
//
//  Created by Swelen Poliana Cesario Ebert on 11/08/22.
//

import Foundation

public struct WeatherModel: Codable {
    var dt: Int
    var currentWeather: Double
    var minTemp: Double
    var maxTemp: Double
    var conditionId: Int
    var weatherDescription: String
    var weatherIcon: String
    var localName: String
    
    
    var conditionImage: String {
        switch conditionId {
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
       
        case dt = "dt"
        case currentWeather = "temp"
        case minTemp = "temp_min"
        case maxTemp = "temp_max"
        case conditionId = "id"
        case weatherDescription = "description"
        case weatherIcon = "icon"
        case localName = "name"
        
    }
}


