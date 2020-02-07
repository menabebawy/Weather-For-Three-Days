//
//  HourCollectionViewCell.swift
//  ForecastModule
//
//  Created by user165891 on 2/7/20.
//  Copyright © 2020 Mena. All rights reserved.
//

import UIKit
import Entities

final class HourCollectionViewCell: UICollectionViewCell {
    @IBOutlet weak private var houreLabel: UILabel!
    @IBOutlet weak private var temperatureImageView: UIImageView!
    @IBOutlet weak private var temperatureLabel: UILabel!
    
    func configure(_ city: City) {
    }

}
