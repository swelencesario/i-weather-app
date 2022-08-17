//
//  CustomTbCell.swift
//  iWeatherApp
//
//  Created by Swelen Poliana Cesario Ebert on 11/08/22.
//

import UIKit

class ForecastTbCell: UITableViewCell {
    
    var viewModel: WeatherItemsViewModel?
 
    @IBOutlet weak var dateLabel: UILabel!
    
    @IBOutlet weak var icon: UIImageView!
    
    @IBOutlet weak var maxTempLabel: UILabel!
    
    @IBOutlet weak var minTemLabel: UILabel!
    
    @IBOutlet weak var contentCell: UIView! {
        didSet {
            contentCell.layer.cornerRadius = 12
        }
    }
    
    func setup(_ viewModel: WeatherItemsViewModel) {
        dateLabel.text = viewModel.stringDate(viewModel.dt ?? 0)
        //icon.image =
        maxTempLabel.text = "H: " + String(viewModel.maxTemp) + "°C"
        minTemLabel.text = "L: " + String(viewModel.minTemp) + "°C"
        
   }
}

