//
//  WeatherRepository.swift
//  iWeatherApp
//
//  Created by Swelen Poliana Cesario Ebert on 11/08/22.
//

import Foundation
import Alamofire

public class WeatherRepository: WeatherRepositoryProtocol {
    public func fetchByLocal(local: String, completion: @escaping (WeatherData?) -> ()) {
        let dictionaryLocal = ["by_city": local]
        AF.request(RepositoryConstants.baseUrl, method: .get, parameters: dictionaryLocal)
            .responseData { (response) in
                switch response.result {
                case .success(_):
                    guard let data = response.data else {
                        completion(nil)
                        return
                    }
                    do {
                        let result = try JSONDecoder().decode(WeatherData.self, from: data)
                        completion(result)
                    } catch {
                        completion(nil)
                    }
                case .failure(_):
                    completion(nil)
                }
            }
    }
    
  
    
    
   
    
//    func parseJSON(_ weatherData: Data) -> WeatherModel? {
//        let decoder = JSONDecoder()
//        do {
//            let decodedData = try decoder.decode(WeatherData.self, from: weatherData)
//            let id = decodedData.weather[0].id
//            let description = decodedData.weather.description
//            let icon = decodedData.weather[0].icon
//            let currentTemp = decodedData.main.temp
//
//            let weather = WeatherModel(id: id, description: description, icon: icon, currentWeather: currentTemp)
//
//            return weather
//        } catch {
//            return nil
//        }
//    }
}
