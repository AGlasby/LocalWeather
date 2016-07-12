//
//  Constants.swift
//  LocalWeather
//
//  Created by Alan on 11/07/2016.
//  Copyright © 2016 Alan Glasby. All rights reserved.
//

import Foundation

let URL_BASE = "http://api.openweathermap.org/data"
let API_VERSION = "/2.5/"
let WEATHER = "weather?"
let FIND_CITY = "find?"
let API_KEY = "&appid=8778450208a894cc4a57b5fb1858eff0"

let BY_CITY = "q="
let BY_ID = "id="
let BY_ZIP = "zip="

let RADIUS = 10000.00
let CITY_COUNT = 10

typealias DownloadComplete = () -> ()

