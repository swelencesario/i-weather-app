//
//  ForecastRepositoryProtocol.swift
//  iWeatherApp
//
//  Created by Swelen Poliana Cesario Ebert on 16/08/22.
//

import Foundation

public protocol ForecastRepositoryProtocol {
    
    func fetchFiveDaysForecast(longitude: String, latitude: String, completion: @escaping ([ForecastModel]) -> ())
}
