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
//                var urlBuilder = URLComponents()
//                urlBuilder.scheme = "https"
//                urlBuilder.host = RepositoryConstants.host
//                urlBuilder.path = RepositoryConstants.forecastPath
//                urlBuilder.queryItems = [
//                    URLQueryItem(name: "appid", value: RepositoryConstants.API_KEY),
//                    URLQueryItem(name: "units", value: RepositoryConstants.units),
//                    URLQueryItem(name: "q", value: local)
//                ]
//                let url = urlBuilder.url!
//
//                AF.request(url).validate()
//                    .responseDecodable(of: WeatherData.self, queue: .main, decoder: JSONDecoder()) { (response) in
//                        switch response.result {
//                        case .success(let weatherData):
//                            let weatherModel = weatherData
//                            completion(weatherModel)
//                            debugPrint(response)
//                        case .failure(_):
//                            completion([])
//                        }
//
//                    }
    }
    
    public func fetchByCoreLocation(longitude: String, latitude: String, completion: @escaping ([List]) -> ()) {
        var urlBuilder = URLComponents()
        urlBuilder.scheme = "https"
        urlBuilder.host = RepositoryConstants.host
        urlBuilder.path = RepositoryConstants.forecastPath
        urlBuilder.queryItems = [
            URLQueryItem(name: "appid", value: RepositoryConstants.API_KEY),
            URLQueryItem(name: "units", value: RepositoryConstants.units),
            //URLQueryItem(name: "cnt", value: RepositoryConstants.cnt),
            URLQueryItem(name: "lat", value: latitude),
            URLQueryItem(name: "lon", value: longitude)
        ]
        let url = urlBuilder.url!
        
        AF.request(url)
            .validate()
            .responseDecodable(of: WeatherData.self, queue: .main, decoder: JSONDecoder()) { (response) in
            switch response.result {
            case .success(let weatherData):
                debugPrint(response)
                let model = weatherData.list
                completion(model)
            case .failure(_):
                completion([])
            }
                
            
            }
        
    }
    
}
