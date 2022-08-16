//
//  WeatherRepositoryProtocol.swift
//  iWeatherApp
//
//  Created by Swelen Poliana Cesario Ebert on 11/08/22.
//

import Foundation

public protocol WeatherRepositoryProtocol {
    
    func fetchByLocal(local: String, completion: @escaping ([WeatherModel]) -> ())
    func fetchByCoreLocation(longitude: String, latitude: String, completion: @escaping ([WeatherModel]) -> ())
}
