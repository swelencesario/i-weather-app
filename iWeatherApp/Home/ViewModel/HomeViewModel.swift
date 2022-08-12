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
    var localName: String
    var icon = Observable<URL>?(nil)
    var weatherDescription = Observable<String?>(nil)
    var maxTemp = Observable<Double?>(nil)
    var minTemp = Observable<Double?>(nil)
    
    var weatherRepository: WeatherRepositoryProtocol
    
    init(localName: String, repository: WeatherRepositoryProtocol = WeatherRepository()) {
        self.localName = localName
        weatherRepository = repository
    }
    
    
    func getWeatherByLocation() {
        weatherRepository.fetchByLocal(local: localName) { [weak self] weather in
            guard let weather = weather else {
                print("error")
                return
            }
            
        }
    }
}
