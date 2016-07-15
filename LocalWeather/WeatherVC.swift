//
//  WeatherVC.swift
//  LocalWeather
//
//  Created by Alan on 14/07/2016.
//  Copyright © 2016 Alan Glasby. All rights reserved.
//

import UIKit
import Alamofire

class WeatherVC: UIViewController {
    
    
    var weatherCity: City!
    
    @IBOutlet weak var cityLBL: UILabel!
    @IBOutlet weak var cityTmpLbl: UILabel!
    @IBOutlet weak var cityMaxLbl: UILabel!
    @IBOutlet weak var cityMinLbl: UILabel!
    @IBOutlet weak var cityHumidityLbl: UILabel!
    @IBOutlet weak var cityPressureLbl: UILabel!
    

    override func viewDidLoad() {
        super.viewDidLoad()
        
        cityLBL.text = weatherCity.name
        getWeatherForCity(String(weatherCity.id)) { () -> () in
            
        }
    }

    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    

    func getWeatherForCity(id: String, completed: DownloadComplete) {
//        Returns current weather for city
        
        let getWeatherUrl = "\(URL_BASE)\(API_VERSION)\(WEATHER_BY_ID)"
        let loc = id
        let apiCall = "\(getWeatherUrl)\(loc)\(TEMP_UNITS)\(API_KEY)"
        let url = NSURL(string: apiCall)
        
        print(apiCall)
        
        Alamofire.request(.GET, url!).responseJSON { response in
            
            let result = response.result
            
            if let dict = result.value as? [String: AnyObject] {
                
                if let main = dict["main"] as? [String: AnyObject] {
                    
                    let temp = main["temp"] as? Double
                    let temp_max = main["temp_max"] as? Double
                    let temp_min = main["temp_min"] as? Double
                    let humidity = main["humidity"] as? Int
                    let pressure = main["pressure"] as? Int

                    self.cityTmpLbl.text = String(roundToPlaces(temp!, decimalPlaces: 2))
                    self.cityMaxLbl.text = String(roundToPlaces(temp_max!, decimalPlaces: 2))
                    self.cityMinLbl.text = String(roundToPlaces(temp_min!, decimalPlaces: 2))
                    self.cityHumidityLbl.text = String(humidity!)
                    self.cityPressureLbl.text = String(pressure!)
                } else {
                    print("Main not returned")
                }
                
                if let daylight = dict["sys"] as? [String: AnyObject] {
                    let sunriseDt = daylight["sunrise"] as? Int
                    let sunrise = timeConverter(Double(sunriseDt!))
                    let sunsetDt = daylight["sunset"] as? Int
                    let sunset = timeConverter(Double(sunsetDt!))
                } else {
                    print("Sys not returned")
                }
                
                if let wind = dict["wind"] as? [String: AnyObject] {
                    let direction = wind["deg"] as? Int
                    let speed = wind["speed"] as? Double
                    print(String(roundToPlaces(speed!, decimalPlaces: 2)))
                } else {
                    print("Wind not returned")
                }
                
                for x in 0...(dict["weather"]?.count)! - 1 {
                    if let weather = dict["weather"]![0] as? [String: AnyObject] {
                        let description = weather["description"]
                        let main = weather["main"]
                        print("\(main!) \(description!) ")
                    } else {
                        print("Weather not returned")
                    }
                }
                
                if let dateTime = dict["dt"] as? Int {
                    let date = timeConverter(Double(dateTime))
                    print(date)
                } else {
                    print("Date and Time not returned")
                }
                
            }
        }
        completed()
    }

    func getForecastForCity(id: String, completed: DownloadComplete) {
//        Returns five day, 3 hour forecast for city
//        
//        let getWeatherUrl = "\(URL_BASE)\(API_VERSION)\(WEATHER_BY_ID)"
//        let loc = id
//        let apiCall = "\(getWeatherUrl)\(loc)\(TEMP_UNITS)\(API_KEY)"
//        let url = NSURL(string: apiCall)
//        
//        print(apiCall)
//        
//        Alamofire.request(.GET, url!).responseJSON { response in
//            
//            let result = response.result
//            
//            if let dict = result.value as? Dictionary<String, AnyObject> {
//                
//            }
//        }
//        completed()
    }
}
