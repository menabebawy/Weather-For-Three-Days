//
//  ForecastModuleInteractor.swift
//  ForecastModule
//
//  Created by Mena Bebawy on 2/7/20.
//  Copyright © 2020 Mena. All rights reserved.
//

import Foundation
import NetworkLayer
import Entities

final class ForecastModuleInteractor {
    var interactorToPresenterProtocol: ForecastModuleInteractorToPresenter!
    let sessionProvider = URLSessionProvider()
}

// MARK: - Forecast module presenter to interactor

extension ForecastModuleInteractor: ForecastModulePresenterToInteractor {
    func fetchForecast(cityId: String) {
        let service = WeatherService.forecast(cityIdString: cityId)
        sessionProvider.request(type: Forecasts.self, service: service) { [weak self] response in
            guard let `self` = self else { return }
            switch response {
            case let .success(forecasts):
                self.interactorToPresenterProtocol.fetchedForecasts(forecasts.list)
            case let .failure(error):
                self.interactorToPresenterProtocol.failed(error: error.localizedDescription)
            }
        }
    }

}
