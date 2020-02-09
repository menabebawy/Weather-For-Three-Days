//
//  ForecastModuleInteractorToPresenter.swift
//  ForecastModule
//
//  Created by Mena Bebawy on 2/7/20.
//  Copyright © 2020 Mena. All rights reserved.
//

import Entities

protocol ForecastModuleInteractorToPresenter {
    func fetchedForecasts(_ forecasts: [Forecast])
    func fetchedError(_ description: String)
}
