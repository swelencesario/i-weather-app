//
//  HomeViewModel.swift
//  iWeatherApp
//
//  Created by Swelen Poliana Cesario Ebert on 11/08/22.
//

import Foundation
import Alamofire

public class HomeViewModel {
    
    var localName: String?
    var latitude: String?
    var longitude: String?
    var weatherResults = Observable<[ListViewModel]?>(nil)
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
    
    //    func getWeatherByCity(_ local: String) {
    //        weatherRepository.fetchByLocal(local: local) { weatherDetails in
    //            self.weatherResults.value = weatherDetails.map{ WeatherItemsViewModel($0)
    //            }
    //        }
    //    }
    
    func getWeatherByCoreLocation(_ longitude: String, _ latitude: String) {
        var listViewModel: [ListViewModel] = []
        weatherRepository.fetchByCoreLocation(longitude: longitude, latitude: latitude) { weatherDetails in
            
            for weatherDetail in weatherDetails {
                if weatherDetail.dt_txt.hasSuffix("12:00:00") == true {
                    listViewModel.append(ListViewModel(weatherDetail))
                }
            }
            self.weatherResults.value = listViewModel
        }
    }
}
