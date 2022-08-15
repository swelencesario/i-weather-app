//
//  HomeViewModel.swift
//  iWeatherApp
//
//  Created by Swelen Poliana Cesario Ebert on 11/08/22.
//

import Foundation

public class HomeViewModel {
    
    var loading = Observable<Bool>(false)
    var weatherDate = Observable<String?>(nil)
    var localName: String?
    var latitude: String?
    var longitude: String?
    var icon = Observable<URL>?(nil)
    var weatherDescription = Observable<String?>(nil)
    var maxTemp = Observable<Double?>(nil)
    var minTemp = Observable<Double?>(nil)
    var weatherResults = Observable<[WeatherViewModel]?>(nil)
    
    var weatherRepository: WeatherRepositoryProtocol
    
    init(repository: WeatherRepositoryProtocol = WeatherRepository()) {
        
        weatherRepository = repository
    }
    
    func customData(_ dt: Int) -> String {
        let dateFormatter = DateFormatter()
        dateFormatter.dateStyle = .medium
        dateFormatter.timeStyle = .none
        dateFormatter.locale = Locale(identifier: "en_US")
        
        let datekoi = Date(timeIntervalSince1970: TimeInterval(dt))
        
        let customDate = dateFormatter.string(from: datekoi)
        
        return customDate
    }
    
    func getWeatherByCity(_ local: String) {
        weatherRepository.fetchByLocal(local: local) { weatherDetails in
            self.weatherResults.value = weatherDetails.map{ WeatherViewModel($0)
            }
        }
    }
    
    func getWeatherByCoreLocation(_ longitude: String, _ latitude: String) {
        weatherRepository.fetchByCoreLocation(longitude: longitude, latitude: latitude) { weatherDetails in
            self.weatherResults.value = weatherDetails.map{ WeatherViewModel($0)
            }
        }
    }
}
