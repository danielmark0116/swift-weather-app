//
//  WeatherManager.swift
//  Clima
//
//  Created by Daniel Grychtoł on 20/05/2020.
//  Copyright © 2020 App Brewery. All rights reserved.
//

import UIKit

protocol WeatherProtocol {
    var weather: String? {get set}
    var activeCity: String? {get set}
    
}

struct WeatherManager: WeatherProtocol {
    let config: OpenWeather = OpenWeather()
    var weather: String?
    var activeCity: String?
    
    mutating func getWeatherForCity(city: String) {
        print("Fetching the weather for city: \(city)")
        
        self.activeCity = city

        let url = config.baseUrl + "?q=\(city)&appid=\(config.apiKey)"
        
        print(url)
        
        fetchWeather(urlString: url)
    }
    
    func fetchWeather(urlString: String) {
        if let url = URL(string: urlString) {
            let session = URLSession(configuration: .default)
            
            let task = session.dataTask(with: url, completionHandler: handler(data:response:err:))
            
            print("strarting the task")
            task.resume()
        }
    }
    
    func handler(data: Data?, response: URLResponse?, err: Error?) {
        if err != nil {
            print("Error occured while fetching weather data")
        }
        
        if let receivedData = data {
            let encoded = String(data: receivedData, encoding: .utf8)
            
            print(encoded ?? "No data")
        }
        
    }

}
