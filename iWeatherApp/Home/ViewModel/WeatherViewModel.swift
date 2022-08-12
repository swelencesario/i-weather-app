//
//  WeatherViewModel.swift
//  iWeatherApp
//
//  Created by Swelen Poliana Cesario Ebert on 12/08/22.
//

import Foundation

public class WeatherViewModel {
    
    var weekDay: String
    var icon: String
    var maxTemp: Double
    var minTemp: Double
    
    init(weather: WeatherModel) {
        self.weekDay = ""
        self.icon = weather.icon ?? ""
        self.maxTemp = weather.tempMax ?? 0.0
        self.minTemp = weather.tempMin ?? 0.0
        
    }
}
