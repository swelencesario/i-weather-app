//
//  WeatherRepository.swift
//  iWeatherApp
//
//  Created by Swelen Poliana Cesario Ebert on 11/08/22.
//

import Foundation
import Alamofire

public class WeatherRepository: WeatherRepositoryProtocol {
    public func fetchByLocal(local: String, completion: @escaping ([WeatherModel]) -> ()) {
        var urlBuilder = URLComponents()
        urlBuilder.scheme = "https"
        urlBuilder.host = RepositoryConstants.host
        urlBuilder.path = RepositoryConstants.path
        urlBuilder.queryItems = [
            URLQueryItem(name: "appid", value: RepositoryConstants.API_KEY),
            URLQueryItem(name: "units", value: RepositoryConstants.units),
            URLQueryItem(name: "q", value: local)
        ]
        let url = urlBuilder.url!
        
        AF.request(url).validate()
            .responseDecodable(of: WeatherData.self, queue: .main, decoder: JSONDecoder()) { (response) in
                switch response.result {
                case .success(let weatherData):
                    let weatherModel = weatherData.model
                    completion([weatherModel])
                    print(completion)
                case .failure(_):
                    completion([])
                }
              
                }
            }
//        let dictionaryLocal = ["by_city": local]
//        AF.request(RepositoryConstants.baseUrl, method: .get, parameters: dictionaryLocal)
//            .responseData { (response) in
//                switch response.result {
//                case .success(_):
//                    if let data = response.data {
//                        let decoded = self.parseJSON(data) //TODO: - ação de atualizar o tempo.
//                        completion([decoded!])
//                        print(decoded!)
//                    }
//                case .failure(_):
//                    completion([])
//                }
//            }
    }
    
    func parseJSON(_ weatherData: Data) -> WeatherModel? {
        let decoder = JSONDecoder()
        do {
            let decodedData = try decoder.decode(WeatherData.self, from: weatherData)
            let id = decodedData.weather[0].id
            let description = decodedData.weather[0].description
            let icon = decodedData.weather[0].icon
            let currentTemp = decodedData.main.temp
            let minTemp = decodedData.main.temp_min
            let maxTemp = decodedData.main.temp_max
            let dt = decodedData.dt
            let timezone = decodedData.timezone
            let name = decodedData.name
            
            let weather = WeatherModel(id: id, mainDescription: description, icon: icon, currentWeather: currentTemp, tempMin: minTemp, tempMax: maxTemp, dt: dt, localTimezone: timezone, name: name)
            
            return weather
        } catch {
            return nil
        }
    }


