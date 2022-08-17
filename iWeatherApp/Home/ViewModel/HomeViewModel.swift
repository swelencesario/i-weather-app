//
//  HomeViewModel.swift
//  iWeatherApp
//
//  Created by Swelen Poliana Cesario Ebert on 11/08/22.
//

import Foundation

public class HomeViewModel {
    
    var localName: String?
    var latitude: String?
    var longitude: String?
    var weatherResults = Observable<[WeatherItemsViewModel]?>(nil)
    var weatherRepository: WeatherRepositoryProtocol
    
    init(repository: WeatherRepositoryProtocol = WeatherRepository()) {
        
        self.weatherRepository = repository
    }
    
    func customDate(_ dt: Int) -> String {
        let dateFormatter = DateFormatter()
        dateFormatter.dateStyle = .medium
        dateFormatter.timeStyle = .none
        dateFormatter.locale = Locale(identifier: "en_US")
        
        let dateToday = Date(timeIntervalSince1970: TimeInterval(dt))
        
        let customDate = dateFormatter.string(from: dateToday)
        
        return customDate
    }
    
    func getWeatherByCity(_ local: String) {
        weatherRepository.fetchByLocal(local: local) { weatherDetails in
            self.weatherResults.value = weatherDetails.map{ WeatherItemsViewModel($0)
            }
        }
    }
    
    func getWeatherByCoreLocation(_ longitude: String, _ latitude: String) {
        weatherRepository.fetchByCoreLocation(longitude: longitude, latitude: latitude) { weatherDetails in
            self.weatherResults.value = weatherDetails.map{ WeatherItemsViewModel($0)
            }
        }
    }
}
