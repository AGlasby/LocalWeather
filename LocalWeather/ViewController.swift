//
//  ViewController.swift
//  LocalWeather
//
//  Created by Alan on 11/07/2016.
//  Copyright © 2016 Alan Glasby. All rights reserved.
//

import UIKit
import MapKit


class ViewController: UIViewController, MKMapViewDelegate {
    

    let regionRadius: CLLocationDistance = RADIUS
    let locationManager = CLLocationManager()
    

    override func viewDidLoad() {
        super.viewDidLoad()

        
    }
    
    override func viewDidAppear(animated: Bool) {
        locationAuthStatus()
    }
    

    func getCurrentLocation() {
        
    }

    func locationAuthStatus() {
        if CLLocationManager.authorizationStatus() == .AuthorizedWhenInUse {
        } else {

            locationManager.requestWhenInUseAuthorization()
        }
    }
    

}

