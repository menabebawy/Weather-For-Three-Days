//
//  ForecastModulePresenter.swift
//  ForecastModule
//
//  Created by Mena Bebawy on 2/7/20.
//  Copyright © 2020 Mena. All rights reserved.
//

import Foundation
import Entities

final class ForecastModulePresenter {
    weak var view: ForecastModulePresenterToView!
    var interactor: ForecastModulePresenterToInteractor!
}

// MARK: - Forecast module view to presenter

extension ForecastModulePresenter: ForecastModuleViewToPresenter {
    func viewIsLoading(cityId: Int) {
        interactor.fetchForecast(cityId: "\(cityId)")
        
    }
    
    func viewIsReady() {
        view.setTitle()
        view.configureTableView()
    }
    
}

// MARK: - Forecast module presenter to interactor

extension ForecastModulePresenter: ForecastModuleInteractorToPresenter {
    func fetchedForecasts(_ forecasts: [Forecast]) {
        // Update hourly list
        // Update next 3 days list
    }
    
    func failed(error: String) {
    }
    
}
