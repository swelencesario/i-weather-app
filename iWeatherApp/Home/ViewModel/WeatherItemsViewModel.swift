//
//  WeatherViewModel.swift
//  iWeatherApp
//
//  Created by Swelen Poliana Cesario Ebert on 12/08/22.
//

import Foundation
import UIKit

public class WeatherItemsViewModel {
    
    var weekDay: String?
    var icon: String
    var currentTemp: Double
    var maxTemp: Double
    var minTemp: Double
    var mainDescription: String?
    var localName: String?
    var dt: Int?
    var iconPath: String
    
    var temperatureString: String {
        return String(format: "%.0f", currentTemp)
    }
    
    var maxString: String {
        return String(format: "%.0f", maxTemp)
    }
    
    var minString: String {
        return String(format: "%.0f", minTemp)
    }
    
    init(_ weather: WeatherModel) {
       
        self.icon = weather.weatherIcon
        self.maxTemp = weather.maxTemp
        self.minTemp = weather.minTemp
        self.currentTemp = weather.currentWeather
        self.mainDescription = weather.weatherDescription
        self.localName = weather.localName
        self.dt = weather.dt
        self.iconPath = "https://openweathermap.org/img/wn/\(icon)@2x.png"
        
    }
 
    func stringDate(_ dt: Int) -> String {
        let dateFormatter = DateFormatter()
        dateFormatter.dateStyle = .medium
        dateFormatter.timeStyle = .none
        dateFormatter.locale = Locale(identifier: "en_US")
        
        let dateToday = Date(timeIntervalSince1970: TimeInterval(dt))
        
        let customDate = dateFormatter.string(from: dateToday)
        
        return customDate
    }
}

