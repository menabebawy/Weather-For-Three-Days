//
//  ForecastModulePresenter.swift
//  ForecastModule
//
//  Created by Mena Bebawy on 2/7/20.
//  Copyright © 2020 Mena. All rights reserved.
//

import Foundation
import Entities
import Utils

final class ForecastModulePresenter {
    weak var view: ForecastModulePresenterToView!
    var interactor: ForecastModulePresenterToInteractor!
    
    private var city: City!

}

// MARK: - Forecast module view to presenter

extension ForecastModulePresenter: ForecastModuleViewToPresenter {
    func viewIsLoading(city: City) {
        self.city = city
        interactor.fetchForecast(cityId: "\(city.id)")
    }
    
    func viewIsReady() {
        view.setTitle()
        view.configureTableView()
    }
    
}

// MARK: - Forecast module presenter to interactor

extension ForecastModulePresenter: ForecastModuleInteractorToPresenter {
    func fetchedForecasts(_ forecasts: [Forecast]) {
        var forecasts = forecasts
        let timeZone = city.system.timeZone
        
        // Assign dateAdapter property
        forecasts.mutateEach { $0.dateAdapter = DateAdapter(
            dateAdaptee: DateAdaptee(since1970: $0.date, timeZone: timeZone)) }
        
        // Update hourly list
        view.loadHourlyForecasts(forecasts.filter { $0.isCurrentDay })
    }
    
    func failed(error: String) {
    }
    
}
