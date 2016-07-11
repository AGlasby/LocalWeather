//
//  CityWeather.swift
//  LocalWeather
//
//  Created by Alan on 11/07/2016.
//  Copyright © 2016 Alan Glasby. All rights reserved.
//

import Foundation
import Alamofire

class CityWeather {
    
    private var _cityName: String!
    private var _cityState: String!
    private var _cityCountry: String!
    private var _cityId: Int
    
    private var _cityLat: Double!
    private var _cityLong: Double!
    
    private var _cityTemp: Double!
    
    var cityName: String {
        return _cityName
    }
    
    var cityTemp: Double {
        return _cityTemp
    }
  
    
    init(name: String, state: String, country: String, id: Int, location: Location) {
        _cityName = name
        _cityState = state
        _cityCountry = country
        _cityId = id
        _cityLat = location.lat
        _cityLong = location.long
        
    }
    
    
    func downloadCityWeatherDetails () {
        
    }
    
    func getNearestCities() {
        
    }
    
}
