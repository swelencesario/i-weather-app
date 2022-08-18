//
//  ListViewModel.swift
//  iWeatherApp
//
//  Created by Swelen Poliana Cesario Ebert on 18/08/22.
//

import Foundation

public class ListViewModel {
    var dt: Int
    var icon: String
    var temp_min: Double
    var temp_max: Double
    
    init(_ list: List) {
        dt = list.dt
        icon = list.weather.first?.icon ?? ""
        temp_min = list.main.temp_min
        temp_max = list.main.temp_max
    }
}
