//
//  WeatherModel.swift
//  Clima
//
//  Created by NANI on 25/12/19.
//  Copyright © 2019 App Brewery. All rights reserved.
//

import Foundation

struct WeatherModel {
    let conditionId: Int
    let tempareture: Double
    let cityName: String
    var tempString: String{
        return String(format: "%.1f", tempareture)
    }
    var conditionname : String{
        switch conditionId {
        case 200...232:
            return "cloud.bolt"
        case 300...321:
            return "cloud.drizzle"
        case 500...531:
            return "cloud.rain"
        case 600...622:
            return "cloud.snow"
        case 701...781:
            return "cloud.fog"
        case 800:
            return "sun.max"
        case 801...804:
            return "cloud.bolt"
        default:
            return "cloud"
        }
    }

}
