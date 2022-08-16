//
//  ForecastViewModel.swift
//  iWeatherApp
//
//  Created by Swelen Poliana Cesario Ebert on 15/08/22.
//

import Foundation

public class ForecastViewModel {
    var weatherDate: String
    var weatherIcon: String
    var maxTemp: Double
    var minTemp: Double
    
    init(_ forecastModel: ForecastModel) {
    
    self.weatherDate = forecastModel.weatherDate
    self.weatherIcon = forecastModel.weatherIcon
    self.maxTemp = forecastModel.maxTemp
    self.minTemp = forecastModel.minTemp
    }
}
