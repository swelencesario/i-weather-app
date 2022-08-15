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
    var currentTemp: Double
    var maxTemp: Double
    var minTemp: Double
    var mainDescription: String
    var localName = "London"
    var dt: Int
    
    init(_ weather: WeatherModel) {
        self.weekDay = ""
        self.icon = weather.icon ?? ""
        self.maxTemp = weather.tempMax ?? 0.0
        self.minTemp = weather.tempMin ?? 0.0
        self.currentTemp = weather.currentWeather ?? 0.0
        self.mainDescription = weather.mainDescription ?? ""
        self.localName = weather.name
        self.dt = weather.dt
        
    }
}
