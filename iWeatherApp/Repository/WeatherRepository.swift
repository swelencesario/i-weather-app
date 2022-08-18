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
                urlBuilder.path = RepositoryConstants.forecastPath
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
                            completion(weatherModel)
                            debugPrint(response)
                        case .failure(_):
                            completion([])
                        }
        
                    }
    }
    
    public func fetchByCoreLocation(longitude: String, latitude: String, completion: @escaping ([WeatherData]) -> ()) {
        var urlBuilder = URLComponents()
        urlBuilder.scheme = "https"
        urlBuilder.host = RepositoryConstants.host
        urlBuilder.path = RepositoryConstants.forecastPath
        urlBuilder.queryItems = [
            URLQueryItem(name: "appid", value: RepositoryConstants.API_KEY),
            URLQueryItem(name: "units", value: RepositoryConstants.units),
            URLQueryItem(name: "cnt", value: RepositoryConstants.cnt),
            URLQueryItem(name: "lat", value: latitude),
            URLQueryItem(name: "lon", value: longitude)
        ]
        let url = urlBuilder.url!
        
        AF.request(url, method: .get).validate()
            .responseData { (response) in
                switch response.result {
                case .success(_):
                    debugPrint(response)
                    guard let data = response.data else {
                        completion([])
                        return
                    }
                    
                    do {
                        let result: WeatherData = try JSONDecoder().decode(WeatherData.self, from: data)
                        print(result)
                        completion([result])
                    } catch {
                        print(error)
                        completion([])
                        
                    }
                case .failure(_):
                    completion([])
                }
                
            }
    }
    
}
