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

class City {
    private var _name: String!
    private var _id: Int!
    private var _location = Location(latitude: 0.00, longitude: 0.00)
    
    var name: String {
        return _name
    }
    
    var id: Int {
        return _id
    }
    
    var location: Location {
        return _location
    }
    
    init(name: String, id: Int, lat: Double, long: Double) {
        _name = name
        _id = id
        self._location.setLat(lat)
        _location.setLong(long)        
    }
    
    func setName(name: String) {
        _name = name
    }
    
    func setId(id: Int) {
        _id = id
    }
    
    func setLoc(location: Location) {
        _location.setLat(location.lat)
        _location.setLong(location.long)
    }
}
