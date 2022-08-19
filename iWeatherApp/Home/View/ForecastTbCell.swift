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
    
    @IBOutlet weak var containerCell: UIView!{
        didSet {
            containerCell.layer.cornerRadius = 12
            containerCell.layer.masksToBounds = false
            containerCell.layer.shadowColor = UIColor.black.cgColor
            containerCell.layer.shadowOpacity = 0.2
            containerCell.layer.shadowOffset = CGSize(width: 0, height: 1)
            containerCell.layer.shadowRadius = 1
        }
    }
    
    @IBOutlet weak var contentCell: UIView! {
        didSet {
            contentCell.layer.cornerRadius = 12
           
        }
    }
    
    func setup(_ viewModel: ListViewModel) {
        self.dateLabel.text = viewModel.weatherDate
        self.maxTempLabel.text = "H: " + String(viewModel.maxTempString) + "°C"
        self.minTemLabel.text = "L: " + String(viewModel.minTempString) + "°C"
        self.icon.loadFrom(URLAddress: "https://openweathermap.org/img/wn/"+"\(viewModel.icon)"+"@2x.png")
        
        if viewModel.weatherDate == "12:00 PM" {
            self.dateLabel.text = viewModel.weatherDate
        }
   }
    
}


