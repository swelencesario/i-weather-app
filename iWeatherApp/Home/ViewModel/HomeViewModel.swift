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
        dateFormatter.dateStyle = .full
        dateFormatter.timeStyle = .none
        dateFormatter.locale = Locale(identifier: "en_US")
        
        let datekoi = Date(timeIntervalSince1970: TimeInterval(dt))
        
        let customDate = dateFormatter.string(from: datekoi)
        
        return customDate
        
        //pegar o date
    }
    
    func getWeatherByLocation(_ local: String) {
        weatherRepository.fetchByLocal(local: localName ?? "") { weatherDetails in
            guard local.count > 0 else {
                print("tratar o erro")
                return
            }
            self.weatherResults.value = weatherDetails.map{ WeatherViewModel($0)
            }
            
        }
            
    }
}
