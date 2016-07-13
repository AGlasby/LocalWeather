//
//  ViewController.swift
//  LocalWeather
//
//  Created by Alan on 11/07/2016.
//  Copyright © 2016 Alan Glasby. All rights reserved.
//

import UIKit
import CoreLocation


class ViewController: UIViewController, CLLocationManagerDelegate, UITableViewDelegate, UITableViewDataSource {
    
    
    let regionRadius: CLLocationDistance = RADIUS
    let locationManager: CLLocationManager = CLLocationManager()
    
    var lat: Double!
    var long: Double!
    var currentLocation = Location(latitude: 0.00,longitude: 0.00)
    var weather: CityWeather!
    var listOfCities: [City]!
    var cityCell: CityTVC!
    
    @IBOutlet weak var locateBtn: UIButton!
    @IBOutlet weak var nearestLbl: UILabel!
    @IBOutlet weak var tableView: UITableView!
    
    override func viewDidLoad() {
        super.viewDidLoad()

        tableView.delegate = self
        tableView.dataSource = self
        
        locateBtn.hidden = false
        nearestLbl.hidden = true
        tableView.hidden = true
        locationManager.delegate = self
        locationAuthStatus()
        locationManager.startUpdatingLocation()
        
        weather = CityWeather(name: "")
    }
    
    
    func locationManager(manager: CLLocationManager, didUpdateLocations locations: [CLLocation]) {
        
        let newLocation: CLLocation=locations[0]
        
        lat = newLocation.coordinate.latitude
        long = newLocation.coordinate.longitude
        
    }
    
    
    func locationManager(manager: CLLocationManager, didFailWithError error: NSError) {
        print(error)
    }
    
    
    func locationAuthStatus() {
        if CLLocationManager.authorizationStatus() == .AuthorizedWhenInUse {
            
        } else {
            
            locationManager.requestWhenInUseAuthorization()
        }
    }
    
    
    func numberOfSectionsInTableView(tableView: UITableView) -> Int {
        
        return 1
    }
    
    
    func tableView(tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        
        guard let listOfCities = self.listOfCities else {
            return 0
        }
        
        return listOfCities.count
    }
    
    
    func tableView(tableView: UITableView, cellForRowAtIndexPath indexPath: NSIndexPath) -> UITableViewCell {
        
        if let cell = tableView.dequeueReusableCellWithIdentifier("CityCell") as? CityTVC {
            
            if let listOfCities = self.listOfCities?[indexPath.row] {
                cell.cityNameLbl?.text = listOfCities.name
                cell.distanceLbl?.text = String(roundToPlaces(listOfCities.distance, decimalPlaces: 2))
                
            }
            
            return cell
            
        } else {
        
        return CityTVC()
        }
    }
    
    func roundToPlaces(value: Double, decimalPlaces: Int) -> Double {
        let divisor = pow(10.0, Double(decimalPlaces))
        return round(value * divisor) / divisor
    }
    
    
    func tableView(tableView: UITableView, didSelectRowAtIndexPath indexPath: NSIndexPath) {
        
    }
    
    
   
    
    @IBAction func getLocation(sender: AnyObject) {
        
        if lat != nil && long != nil {
            weather.setCurrentLat(lat)
            weather.setCurrentLong(long)
            currentLocation.setLat(weather.currentLat)
            currentLocation.setLong(weather.currentLong)
            
            locateBtn.hidden = true
            nearestLbl.hidden = false
            tableView.hidden = false
            
            
            weather.getNearestCities(currentLocation) { () -> () in
                self.listOfCities = self.sortCities()

                dispatch_async(dispatch_get_main_queue(), { () -> Void in
                    self.tableView.reloadData()
                })
            }
        }

    }
    
    
    func sortCities() -> [City] {
        var cities: [City] = self.weather.cityList
    
        cities.sortInPlace { $0.distance < ($1.distance) }
        
        for x in 0...(self.weather.cityList.count - 1) {
            print(cities[x].distance)
            print("The id for \(cities[x].name) is \(cities[x].id)")
            print("It is \(cities[x].distance) miles away")
        }
        return cities
    
    }

}

