//
//  Location.swift
//  LocalWeather
//
//  Created by Alan on 11/07/2016.
//  Copyright © 2016 Alan Glasby. All rights reserved.
//

import Foundation


struct Location {
    
    var latitude: Double
    var longitude: Double!
}

class City {
    private var _name: String!
    private var _id: Int!
    private var _location = Location(latitude: 0.00, longitude: 0.00)
    private var _distance: Double!
    
    var name: String {
        return _name
    }
    
    var id: Int {
        return _id
    }
    
    var location: Location {
        return _location
    }
    
    var distance: Double {
        return _distance
    }
    
    init(name: String, id: Int, lat: Double, long: Double) {
        _name = name
        _id = id
        _location.latitude = lat
        _location.longitude = long
    }
    
    func setName(name: String) {
        _name = name
    }
    
    func setId(id: Int) {
        _id = id
    }
    
    func setLoc(location: Location) {
        _location.latitude = location.latitude
        _location.longitude = location.longitude
    }
    
    func setDistance(distance: Double) {
        _distance = distance
    }
}
