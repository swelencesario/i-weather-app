//
//  ViewController.swift
//  iWeatherApp
//
//  Created by Swelen Poliana Cesario Ebert on 11/08/22.
//

import UIKit
import CoreLocation

class HomeViewController: UIViewController {
    
    var locationManager = CLLocationManager()
    
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
    @IBOutlet weak var currentWeatherView: UIView! {
        didSet {
            currentWeatherView.layer.cornerRadius = 22
        }
    }
    
    @IBOutlet weak var tableView: UITableView!
    
let repository = WeatherRepository()
    override func viewDidLoad() {
        super.viewDidLoad()
        
        self.initialSetup()
        self.bindElements()
        
    }

    private func initialSetup() {
        locationManager.delegate = self
        locationManager.requestWhenInUseAuthorization()
        locationManager.requestLocation()
        tableView.delegate = self
        tableView.dataSource = self
    }

    private func bindElements() {
        viewModel.weatherResults.bind {[weak self] weatherResults in
            guard let weatherResults = weatherResults else { return }
            
            self?.weatherResults = weatherResults
            self?.currentTemp.text = String(weatherResults[0].temperatureString) + "°C"
            self?.maxTempLabel.text = "H: " + String(weatherResults[0].maxString) + "°C"
            self?.minTemp.text = "H: " + String(weatherResults[0].minString) + "°C"
            self?.descriptionLabel.text = weatherResults[0].mainDescription
            self?.localNameLabel.text = weatherResults[0].localName
            self?.iconImage.loadFrom(URLAddress: weatherResults[0].iconPath)
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

extension UIImageView {
    func loadFrom(URLAddress: String) {
        guard let url = URL(string: URLAddress) else {
            return
        }
        DispatchQueue.main.async { [weak self] in
            if let imageData = try? Data(contentsOf: url) {
                if let loadedImage = UIImage(data: imageData) {
                    self?.image = loadedImage
                }
            }
        }
    }
}

extension HomeViewController: CLLocationManagerDelegate {
    
    @IBAction func locationPressed(_ sender: UIButton) {
        locationManager.requestLocation()
    }
    
    func locationManager(_ manager: CLLocationManager, didUpdateLocations locations: [CLLocation]) {
        if let location = locations.last {
            locationManager.stopUpdatingLocation()
            let lat = String(location.coordinate.latitude)
            let lon = String(location.coordinate.longitude)
            viewModel.getWeatherByCoreLocation(lon, lat)
            }
    }
    
    func locationManager(_ manager: CLLocationManager, didFailWithError error: Error) {
        print(error)
    }
}
