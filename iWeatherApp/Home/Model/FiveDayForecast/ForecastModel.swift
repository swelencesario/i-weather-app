//
//  ForecastModel.swift
//  iWeatherApp
//
//  Created by Swelen Poliana Cesario Ebert on 15/08/22.
//

import Foundation

public struct ForecastModel {
    var conditionId: Int
    var weatherDate: String
    var weatherIcon: String
    var maxTemp: Double
    var minTemp: Double
    var city: String
    
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
}
