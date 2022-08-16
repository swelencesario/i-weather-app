//
//  ForecastData.swift
//  iWeatherApp
//
//  Created by Swelen Poliana Cesario Ebert on 15/08/22.
//

import Foundation

public struct ForecastData: Codable {
    var list: [List]
    var city: City
    
    var model: ForecastModel {
        return ForecastModel(conditionId: list.first?.weather.first?.id ?? 0, weatherDate: list.first?.dt_txt ?? "", weatherIcon: list.first?.weather.first?.icon ?? "", maxTemp: list.first?.main.temp_max ?? 0.0, minTemp: list.first?.main.temp_min ?? 0.0, city: city.name)
    }
}

public struct List: Codable {
    var main: Main
    var weather: [Weather]
    var dt_txt: String
}

public struct City: Codable {
    var name: String
    var timezone: Int
}

