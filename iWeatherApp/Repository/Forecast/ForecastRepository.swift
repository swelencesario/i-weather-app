//
//  ForecastRepository.swift
//  iWeatherApp
//
//  Created by Swelen Poliana Cesario Ebert on 16/08/22.
//

import Foundation
import Alamofire

public class ForecastRepository: ForecastRepositoryProtocol {
    public func fetchFiveDaysForecast(longitude: String, latitude: String, completion: @escaping ([ForecastModel]) -> ()) {//refatorar aqui
        var urlBuilder = URLComponents()
        urlBuilder.scheme = "https"
        urlBuilder.host = RepositoryConstants.host
        urlBuilder.path = RepositoryConstants.forecastPath
        urlBuilder.queryItems = [
            URLQueryItem(name: "appid", value: RepositoryConstants.API_KEY),
            URLQueryItem(name: "units", value: RepositoryConstants.units),
            URLQueryItem(name: "lat", value: latitude),
            URLQueryItem(name: "lon", value: longitude)
        ]
        let url = urlBuilder.url!
        
        AF.request(url).validate()
            .responseDecodable(of: ForecastData.self, queue: .main, decoder: JSONDecoder()) { (response) in
                switch response.result {
                case .success(let weatherData):
                    let weatherModel = weatherData.model
                    completion([weatherModel])
                    debugPrint(response)
                case .failure(_):
                    completion([])
                }
                
            }
    }
}
