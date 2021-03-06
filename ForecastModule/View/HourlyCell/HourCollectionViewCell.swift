//
//  HourCollectionViewCell.swift
//  ForecastModule
//
//  Created by Mena Bebawy on 2/7/20.
//  Copyright © 2020 Mena. All rights reserved.
//

import UIKit
import Entities

final class HourCollectionViewCell: UICollectionViewCell {
    @IBOutlet weak private var houreLabel: UILabel!
    @IBOutlet weak private var temperatureImageView: UIImageView!
    @IBOutlet weak private var temperatureLabel: UILabel!
    
    static let identifier = "HourCell"
    static let width: CGFloat = 80
    
    func configure(_ forecast: Forecast) {
        houreLabel.text = forecast.hour
        temperatureLabel.text = forecast.main.temperature.celsiusTemperatureStyle()
        temperatureImageView.kf.setImage(with: URL(string: forecast.weather[0].iconURL))
    }

}
