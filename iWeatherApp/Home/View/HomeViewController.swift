//
//  ViewController.swift
//  iWeatherApp
//
//  Created by Swelen Poliana Cesario Ebert on 11/08/22.
//

import UIKit

class HomeViewController: UIViewController {
   
    var viewModel = HomeViewModel()
    var weatherResults = [WeatherViewModel]() {
        didSet {
            tableView.reloadData()
        }
    }
    
    @IBOutlet weak var currentDate: UILabel!
    @IBOutlet weak var minTemp: UILabel!
    @IBOutlet weak var currentTemp: UILabel!
    @IBOutlet weak var maxTempLabel: UILabel!
    @IBOutlet weak var descriptionLabel: UILabel!
    @IBOutlet weak var iconImage: UIImageView!
    @IBOutlet weak var localNameLabel: UILabel!
    @IBOutlet weak var currentWeatherView: UIView!
    
    @IBOutlet weak var tableView: UITableView!
    
let repository = WeatherRepository()
    override func viewDidLoad() {
        super.viewDidLoad()
        
//        self.repository.fetchByLocal(local: "London") { (weatherData) in
//            print("tentei")
            
            self.initialSetup()
            self.viewModel.getWeatherByLocation("London")
            self.bindElements()
        

    }

    private func initialSetup() {
        tableView.delegate = self
        tableView.dataSource = self
    }

    private func bindElements() {
        viewModel.weatherResults.bind {[weak self] weatherResults in
            guard let weatherResults = weatherResults else { return }
            
            self?.weatherResults = weatherResults
            self?.currentTemp.text = String(weatherResults[0].currentTemp)
            self?.maxTempLabel.text = String(weatherResults[0].maxTemp)
            self?.minTemp.text = String(weatherResults[0].minTemp)
            self?.descriptionLabel.text = weatherResults[0].mainDescription
            self?.localNameLabel.text = weatherResults[0].localName
            
            self?.currentDate.text = self?.viewModel.customData(weatherResults[0].dt)
        
            print(weatherResults[0].mainDescription)
        }
        
    }
    
    
    
}

extension HomeViewController: UITableViewDataSource {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        
        return weatherResults.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "weeklyCellIdentifier", for: indexPath) as? WeeklyWeatherTbCell
        cell?.setup(weatherResults[indexPath.row])
        return cell ?? UITableViewCell()
    }
    
}

extension HomeViewController: UITableViewDelegate {
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        
        return
    }
}


