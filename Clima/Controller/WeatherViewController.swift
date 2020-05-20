//
//  ViewController.swift
//  Clima
//
//  Created by Angela Yu on 01/09/2019.
//  Copyright © 2019 App Brewery. All rights reserved.
//

import UIKit

class WeatherViewController: UIViewController, UITextFieldDelegate {
    @IBOutlet weak var conditionImageView: UIImageView!
    @IBOutlet weak var temperatureLabel: UILabel!
    @IBOutlet weak var cityLabel: UILabel!
    @IBOutlet weak var searchField: UITextField!
    var weatherManager = WeatherManager() {
        didSet {
            cityLabel.text = weatherManager.activeCity ?? ""
        }
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
    
        searchField.delegate = self
    }
    
    func validation(stringToValidate: String) -> Bool{
        if (stringToValidate != "") {
            return true
        }
        
        return false
    }


    @IBAction func searchBtnPressed(_ sender: UIButton) {
        let dataFromTextField = searchField.text ?? ""
        
        if (validation(stringToValidate: dataFromTextField)) {
            searchField.endEditing(true)
        }
    }
    
    func textFieldShouldReturn(_ textField: UITextField) -> Bool {
        let dataFromTextField = textField.text ?? ""
        
        if (validation(stringToValidate: dataFromTextField)) {
            searchField.endEditing(true)
            return true
        }
        
        return false
    }
    
    func textFieldDidEndEditing(_ textField: UITextField) {
        if let city = textField.text {
            weatherManager.getWeatherForCity(city: city)
        }
        
    }
    
}

