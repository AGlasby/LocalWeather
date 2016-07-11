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
    
    private var _cityLat: Int!
    private var _cityLong: Int!
    
    private var _cityTemp: Int!
    
    var cityName: String {
        return _cityName
    }
    
    var cityTemp: Int {
        return _cityTemp
    }
    
    init(name: String) {
        _cityName = name
    }
    
    
    func downloadCityWeatherDetails () {
        
    }
    
}
