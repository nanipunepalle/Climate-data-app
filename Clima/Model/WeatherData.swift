//
//  WeatherData.swift
//  Clima
//
//  Created by NANI on 25/12/19.
//  Copyright © 2019 App Brewery. All rights reserved.
//

import Foundation

struct WeatherData: Codable{
    let name: String
    let main: Main
    let weather: [Wheather]
    let wind: Wind
}
struct Main: Codable{
    let temp: Double
    let humidity: Double
    let temp_min: Double
    let temp_max: Double
}
struct Wheather: Codable {
    let description: String
    let id: Int
}
struct Wind: Codable {
    let speed: Double
}
