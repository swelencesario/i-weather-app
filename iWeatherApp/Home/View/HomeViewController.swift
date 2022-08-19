//
//  ViewController.swift
//  iWeatherApp
//
//  Created by Swelen Poliana Cesario Ebert on 11/08/22.
//

//"H: "import UIKit
import CoreLocation
import MapKit

class HomeViewController: UIViewController {
    
    var locationManager = CLLocationManager()
    
    var viewModel = HomeViewModel()
    
    var weatherResults = [ListViewModel]() {
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
        
        let main = Main(temp: 30.0, temp_min: 25.0, temp_max: 30.0)
        let weather = Weather(id: 801, main: "Clouds", description: "few clouds", icon: "02d")
        let list = List(dt: 1660856400, main: main, weather: [weather, weather, weather])
        
        let vm = [ListViewModel(list), ListViewModel(list), ListViewModel(list)]
        
        
        print(vm.description)
        
        
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
            self?.currentDate.text = self?.viewModel.customDate(weatherResults.first?.dt ?? 0)
            self?.iconImage.loadFrom(URLAddress: "https://openweathermap.org/img/wn/"+"\(weatherResults.first?.icon ?? "")"+"@2x.png")
                        self?.currentTemp.text = String(weatherResults[0].currentTemString) + "°C"
            self?.maxTempLabel.text = "H: " + String(weatherResults[0].maxTempString) + "°C"
                        self?.minTemp.text = "L: " + String(weatherResults[0].minTempString) + "°C"
            self?.descriptionLabel.text = weatherResults.first?.description

        }
    }
    
    private func setSpaceCell() {
        tableView?.separatorInset = UIEdgeInsets(top: 0, left: 0, bottom: 12, right: 0)
    }
}

extension HomeViewController: UITableViewDataSource {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        
        return weatherResults.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "weeklyCellIdentifier", for: indexPath) as? ForecastTbCell
        cell?.setup((weatherResults[indexPath.row]))
        return cell ?? UITableViewCell()
    }
    
}

extension HomeViewController: UITableViewDelegate {
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        
        return
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
        let myLocation = CLLocation(latitude: locations.first?.coordinate.latitude ?? 0.0, longitude: locations.first?.coordinate.longitude ?? 0.0)
        myLocation.placemark{ placemark, error in
            guard let placemark = placemark else {
                return
            }
            self.localNameLabel.text = placemark.locality
        }
    }
    
    func locationManager(_ manager: CLLocationManager, didFailWithError error: Error) {
        print(error)
    }
}

extension CLPlacemark {
    var city: String? { locality }
}

extension CLLocation {
    func placemark(completion: @escaping (_ placemark: CLPlacemark?, _ error: Error?) -> ()) {
        CLGeocoder().reverseGeocodeLocation(self) { completion($0?.first, $1) }
    }
}
