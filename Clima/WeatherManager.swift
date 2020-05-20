//
//  WeatherManager.swift
//  Clima
//
//  Created by Daniel Grychtoł on 20/05/2020.
//  Copyright © 2020 App Brewery. All rights reserved.
//

import UIKit

struct WeatherManager {

    var weather: String?
    let config: OpenWeather = OpenWeather()
    
    func getWeatherForCity(city: String) {
        print("Fetching the weather for city: \(city)")
        print(config.baseUrl + "?q=\(city)&appid=\(config.apiKey)")
    }

}
