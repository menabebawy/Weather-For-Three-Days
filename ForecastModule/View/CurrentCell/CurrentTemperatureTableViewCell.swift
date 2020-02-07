//
//  CurrentTemperatureTableViewCell.swift
//  ForecastModule
//
//  Created by user165891 on 2/7/20.
//  Copyright © 2020 Mena. All rights reserved.
//

import UIKit
import Entities
import Kingfisher

final class CurrentTemperatureTableViewCell: UITableViewCell {
    @IBOutlet weak private var temperatureLabel: UILabel!
    @IBOutlet weak private var weatherImageView: UIImageView!
    @IBOutlet weak private var mainLabel: UILabel!
    
    static let identifier = "CurrentWeatherCell"
    static let height: CGFloat = 180
    
    func configure(city: City) {
        mainLabel.text = city.weather[0].main
        temperatureLabel.text = city.main.celsiusTemperatureStyle()
        weatherImageView.kf.setImage(with: URL(string: city.weather[0].icon2XUrl))
    }
    
}
