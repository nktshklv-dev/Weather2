//
//  ViewController.swift
//  Weather-V2
//
//  Created by Nikita  on 8/8/22.
//

import UIKit
import CoreLocation
 
// custom cell - CollectionView
// API / request to get the data
class ViewController: UIViewController, UITableViewDelegate, UITableViewDataSource, CLLocationManagerDelegate {
   
    
    @IBOutlet var table: UITableView!
    let locationManager = CLLocationManager()
    var currentLocation: CLLocation?
    var models = [Weather]()
    override func viewDidLoad() {
        super.viewDidLoad()
        
        //Register 2 cells
        table.register(HourlyTableViewCell.nib(), forCellReuseIdentifier: HourlyTableViewCell.identifier)
        table.register(WeatherTableViewCell.nib(), forCellReuseIdentifier: WeatherTableViewCell.identifier)
        
        table.delegate = self
        table.dataSource = self
        
        setupLocation()
    }
    //Location
    func setupLocation(){
        locationManager.delegate = self
        locationManager.requestWhenInUseAuthorization()
        locationManager.startUpdatingLocation()
    }
    
    func locationManager(_ manager: CLLocationManager, didUpdateLocations locations: [CLLocation]) {
        if !locations.isEmpty, currentLocation == nil{
            currentLocation = locations.first
            locationManager.stopUpdatingLocation()
            requestWeatherForLocation()
        }
    }
    
    //Table
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return models.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        return UITableViewCell()
    }
    
    func requestWeatherForLocation(){
        guard let long = currentLocation?.coordinate.longitude else {return}
        guard let lat = currentLocation?.coordinate.latitude else {return}
        
        print(long, lat)
    }


}

struct Weather{
    
}

