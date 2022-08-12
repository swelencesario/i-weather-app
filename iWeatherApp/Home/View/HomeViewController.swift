//
//  ViewController.swift
//  iWeatherApp
//
//  Created by Swelen Poliana Cesario Ebert on 11/08/22.
//

import UIKit

class HomeViewController: UIViewController {
    
    @IBOutlet weak var currentWeatherView: UIView!
    
    @IBOutlet weak var tableView: UITableView!
    
let repository = WeatherRepository()
    override func viewDidLoad() {
        super.viewDidLoad()
        self.repository.fetchByLocal(local: "London") { (weatherData) in
            print("tentei")
        }
        // Do any additional setup after loading the view.
    }


}

