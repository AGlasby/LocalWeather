
//
//  CityWeather.swift
//  LocalWeather
//
//  Created by Alan on 11/07/2016.
//  Copyright © 2016 Alan Glasby. All rights reserved.
//

import Foundation
import Alamofire
import CoreLocation

class CityWeather {
    
    private var _cityName: String!
    private var _cityState: String!
    private var _cityCountry: String!
    private var _cityId: Int
    
    private var _cityLat: Double!
    private var _cityLong: Double!
    
    private var _cityTemp: Double!
    
    private var _currentLat: Double!
    private var _currentLong:Double!
    private var _cityList: [City] = []
    private var _cityDistance: Double!
    
    
    var cityName: String {
        return _cityName
    }
    
    var cityTemp: Double {
        return _cityTemp
    }
    
    var currentLat: Double {
        return _currentLat
    }

    var currentLong: Double {
        return _currentLong
    }
    
    var cityList: [City] {
        return _cityList
    }
    
    var cityDistance: Double {
        return _cityDistance
    }
  
    
    init(name: String) {
        _cityName = name
        _cityState = ""
        _cityCountry = ""
        _cityId = 0
        _cityLat = 0.00
        _cityLong = 0.00
        _cityDistance = 0.00
    }
    
    func setCurrentLat(latitude: Double) {
        _currentLat = latitude
    }
    
    func setCurrentLong(longitude: Double) {
        _currentLong = longitude
    }
    
    func setCityDistance(distance: Double) {
        _cityDistance = distance
    }
    
    func addCity(city: City) {
        _cityList.append(city)
    }
    
    
    func downloadCityWeatherDetails () {
        
    }

    
    func distanceToCity(firstLoc: Location, secondLoc: Location) -> Double {
        let userLocation:CLLocation = CLLocation(latitude: firstLoc.lat, longitude: firstLoc.long)
        let cityLocation:CLLocation = CLLocation(latitude: secondLoc.lat, longitude: secondLoc.long)
        let meters:CLLocationDistance = userLocation.distanceFromLocation(cityLocation)
        return (meters / 1609.344)
    }
    
    
    func getNearestCities(currentLocation: Location, completed: DownloadComplete) {
        
        let findCityUrl = "\(URL_BASE)\(API_VERSION)\(FIND_CITY)"
        let loc = "lat=\(currentLocation.lat)&lon=\(currentLocation.long)&cnt=\(CITY_COUNT)"
        let apiCall = "\(findCityUrl)\(loc)\(API_KEY)"
        let url = NSURL(string: apiCall)!
        
        Alamofire.request(.GET, url).responseJSON { response in
            
            let result = response.result
            
            if let dict = result.value as? Dictionary<String, AnyObject> {
                if let count = dict["count"] as? Int where count > 0 {
                    for x in 0...(count - 1) {
                        let city = City(name: "Bracknell", id: 0, lat: 0.00, long: 0.00)
                        let name = dict["list"]![x]["name"] as? String
                        city.setName(name!)
                        
                        let id = dict["list"]![x]["id"] as? Int
                        city.setId(id!)
                        
                        let lat = dict["list"]![x]["coord"]!!["lat"] as? Double
                        let long = dict["list"]![x]["coord"]!!["lon"] as? Double
                        let coords = Location(latitude: lat!, longitude: long!)
                        city.setLoc(coords)
                        
                        let distance = self.distanceToCity(currentLocation, secondLoc: city.location)
                        city.setDistance(distance)

                        self.addCity(city)
                    }
                } else {
                    print("No cities returned")
                }
            }
            completed()
        }
    }
    
}
