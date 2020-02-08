//
//  ForecastModulePresenterToView.swift
//  ForecastModule
//
//  Created by Mena Bebawy on 2/7/20.
//  Copyright © 2020 Mena. All rights reserved.
//

import Entities

protocol ForecastModulePresenterToView: class {
    func setTitle()
    func configureTableView()
    func loadHourlyForecasts(_ forecoasts: [Forecast])
    func loadNextDaysForecasts(_ forecasts: [Forecast])
}
