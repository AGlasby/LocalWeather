//
//  ViewController.swift
//  LocalWeather
//
//  Created by Alan on 11/07/2016.
//  Copyright © 2016 Alan Glasby. All rights reserved.
//

import UIKit
import CoreLocation


class ViewController: UIViewController, CLLocationManagerDelegate {
    
    
    let regionRadius: CLLocationDistance = RADIUS
    let locationManager: CLLocationManager = CLLocationManager()
    
    var lat: Double!
    var long: Double!
    var currentLocation = Location(latitude: 0.00,longitude: 0.00)
    var cities: [Dictionary<String, AnyObject>] = []
    
    
    var weather = CityWeather(name: "")
    

    override func viewDidLoad() {
        super.viewDidLoad()
        
        locationManager.delegate = self
        locationAuthStatus()
        locationManager.startUpdatingLocation()
        
        weather = CityWeather(name: "")

        
    }

    func locationManager(manager: CLLocationManager, didUpdateLocations locations: [CLLocation]) {
        
        let newLocation: CLLocation=locations[0]
        
        var coordinateDesc: String = "Not Available"

        
        if newLocation.horizontalAccuracy >= 0 {
            coordinateDesc = "\(newLocation.coordinate.latitude), \(newLocation.coordinate.longitude)"
            coordinateDesc = coordinateDesc + " +/- \(newLocation.horizontalAccuracy) meters"
        }
        
        lat = newLocation.coordinate.latitude
        long = newLocation.coordinate.longitude
        
    }
    
    
    func locationManager(manager: CLLocationManager, didFailWithError error: NSError) {
        
    }
    
    
    func locationAuthStatus() {
        if CLLocationManager.authorizationStatus() == .AuthorizedWhenInUse {
            
        } else {

            locationManager.requestWhenInUseAuthorization()
        }
    }
    
    @IBAction func getLocation(sender: AnyObject) {
        
        currentLocation.setLat(lat)
        currentLocation.setLong(long)
        
        cities = weather.getNearestCities(currentLocation)
        
        print("\(cities[0])")
        print("\(cities[1])")
        

    }

}

