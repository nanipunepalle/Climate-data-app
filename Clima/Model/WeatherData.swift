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
}
struct Main: Codable{
    let temp: Double
}
struct Wheather: Codable {
    let description: String
    let id: Int
}
