//
//  CustomTbCell.swift
//  iWeatherApp
//
//  Created by Swelen Poliana Cesario Ebert on 11/08/22.
//

import UIKit

class ForecastTbCell: UITableViewCell {
 
    @IBOutlet weak var dateLabel: UILabel!
    
    @IBOutlet weak var icon: UIImageView!
    
    @IBOutlet weak var maxTempLabel: UILabel!
    
    @IBOutlet weak var minTemLabel: UILabel!
    
    @IBOutlet weak var contentCell: UIView! {
        didSet {
            contentCell.layer.cornerRadius = 12
        }
    }
    
    func setup(_ viewModel: ListViewModel) {
        self.dateLabel.text = String(viewModel.dt)
        self.maxTempLabel.text = "H: " + String(viewModel.maxTempString) + "°C"
        self.minTemLabel.text = "L: " + String(viewModel.minTempString) + "°C"
        self.icon.loadFrom(URLAddress: "https://openweathermap.org/img/wn/"+"\(viewModel.icon)"+"@2x.png")
   }
}


