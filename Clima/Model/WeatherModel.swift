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
    let humidity: Double
    let windSpeed: Double
    let tempMin: Double
    let tempMax: Double
    var tempString: String{
        return String(format: "%.1f", tempareture)
    }
    var speedString: String{
        return String(format: "%.1f", windSpeed)
    }
    var humidityString: String{
        return String(format: "%.1f", humidity)
    }
    var minTempString: String{
        return String(format: "%.1f", tempMin)
    }
    var maxTempString: String{
           return String(format: "%.1f", tempMax)
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
