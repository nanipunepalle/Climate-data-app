//
//  WeatherManager.swift
//  Clima
//
//  Created by NANI on 25/12/19.
//  Copyright © 2019 App Brewery. All rights reserved.
//

import Foundation
import CoreLocation

protocol WeatherManagerDelegate {
    func didUpdateWeather(_ weatherManager: WeatherManager,weather: WeatherModel)
    func didFailWithError(error: Error)
}

struct WeatherManager {
    let weatherUrl = "https://api.openweathermap.org/data/2.5/weather?appid=8042a1068a0e09e2b802ec551ee6c516&units=metric"
    var delegate: WeatherManagerDelegate?
    func fetch(cityName: String){
        let urlString = "\(weatherUrl)&q=\(cityName)"
        performRequest(urlstring: urlString)
    }
    
    func fetchWeather(latitude: CLLocationDegrees,longitude: CLLocationDegrees){
        let urlstring = "\(weatherUrl)&lat=\(latitude)&lon=\(longitude)"
        performRequest(urlstring: urlstring)
        
    }
    
    func performRequest(urlstring: String){
        
        if let url = URL(string: urlstring){
        let session = URLSession(configuration: .default)
        let task = session.dataTask(with: url, completionHandler: handle(data:response:error:))
        task.resume()
        }
    }
    func handle(data: Data?,response: URLResponse?,error: Error?)
    {
        if error != nil{
            delegate?.didFailWithError(error: error!)
//            print(error!)
            return
            
        }
        if let safeData = data{
            if let weather = self.parseJSON(weatherData: safeData){
//            let weatherVc = WeatherViewController()
//            weatherVc.didUpdateWeather(weather: weather!)
            self.delegate!.didUpdateWeather(self,weather: weather)
            }
        }
    }
    func parseJSON(weatherData: Data) -> WeatherModel?{
        let decoder = JSONDecoder()
        do{
            let decoded = try decoder.decode(WeatherData.self, from: weatherData)
            let id = decoded.weather[0].id
            let temp = decoded.main.temp
            let name =  decoded.name
            let windspeed = decoded.wind.speed
            let humidity = decoded.main.humidity
            let minTemp = decoded.main.temp_min
            let maxTemp = decoded.main.temp_max
            let weather = WeatherModel(conditionId: id, tempareture: temp, cityName: name, humidity: humidity, windSpeed: windspeed, tempMin: minTemp, tempMax: maxTemp)
//            print(weather.tempString)
            return weather
        }catch{
//            print(error)
            delegate?.didFailWithError(error: error)
            return nil
        }
        
        
    }
    

}
