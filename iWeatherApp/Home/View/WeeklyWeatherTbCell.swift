//
//  CustomTbCell.swift
//  iWeatherApp
//
//  Created by Swelen Poliana Cesario Ebert on 11/08/22.
//

import UIKit

class WeeklyWeatherTbCell: UITableViewCell {
    
    var viewModel: WeatherViewModel?
 
    @IBOutlet weak var dateLabel: UILabel!
    
    @IBOutlet weak var icon: UIImageView!
    
    @IBOutlet weak var maxTempLabel: UILabel!
    
    @IBOutlet weak var minTemLabel: UILabel!
    
    @IBOutlet weak var contentCell: UIView! {
        didSet {
            contentCell.layer.cornerRadius = 12
        }
    }
    
    
    func setup(_ viewModel: WeatherViewModel) {
        dateLabel.text = viewModel.weekDay
        //icon.image =
        maxTempLabel.text = String(viewModel.maxTemp)
        minTemLabel.text = String(viewModel.minTemp)
    }
}
