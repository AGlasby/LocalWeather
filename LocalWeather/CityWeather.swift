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
  
    
    init(name: String) {
        _cityName = name
        _cityState = ""
        _cityCountry = ""
        _cityId = 0
        _cityLat = 0.00
        _cityLong = 0.00
        
    }
    
    
    func downloadCityWeatherDetails () {
        
    }
    
    
    func getNearestCities(currentLocation: Location) -> [[String:AnyObject]] {
        var nearbyCities = [[String:AnyObject]]()
        
        let findCityUrl = "\(URL_BASE)\(API_VERSION)\(FIND_CITY)"
        let loc = "lat=\(currentLocation.lat)&lon\(currentLocation.long)&cnt=\(CITY_COUNT)"
        let apiCall = "\(findCityUrl)\(loc)\(API_KEY)"
        let url = NSURL(string: apiCall)!
        
        Alamofire.request(.GET, url).responseJSON { response in
            let result = response.result
            if let dict = result.value as? Dictionary<String, AnyObject> {
                
            }
        }
        
        nearbyCities.append(["a":Int(12345)])
        nearbyCities.append(["b":Int(45345)])
        
        return nearbyCities
        
    }
    
}
