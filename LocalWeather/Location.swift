//
//  Location.swift
//  LocalWeather
//
//  Created by Alan on 11/07/2016.
//  Copyright © 2016 Alan Glasby. All rights reserved.
//

import Foundation


class Location {
    
    private var _lat: Double!
    private var _long: Double!
    
    var lat: Double {
        return _lat
    }
    
    var long: Double {
        return _long
    }
    
    
    init(latitude: Double, longitude: Double) {
        _lat = latitude
        _long = longitude
    }
    
    func setLat(lat: Double) {
        _lat = lat
    }
    
    func setLong(long: Double) {
        _long = long
    }
}
