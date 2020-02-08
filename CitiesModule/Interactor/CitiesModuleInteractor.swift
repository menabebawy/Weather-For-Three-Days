//
//  CitiesModuleInteractor.swift
//  CitiesModule
//
//  Created by Mena bebawy on 2/6/20.
//  Copyright © 2020 Mena. All rights reserved.
//

import Foundation
import NetworkLayer
import  Entities

final class CitiesModuleInteractor {
    var interactorToPresenterProtocol: CitiesModuleInteractorToPresenter!
    let sessionProvider = URLSessionProvider()
}

// MARK: - Cities module presenter to interactor

extension CitiesModuleInteractor: CitiesModulePresenterToInteractor {
    func fetchCities(idsString: String) {
        let service = WeatherService.cities(idsString: idsString)
        sessionProvider.request(type: Cities.self, service: service) { [weak self] response in
            guard let `self` = self else { return }
            switch response {
            case let .success(cities):
                self.interactorToPresenterProtocol.fetchedCities(cities.list)
            case let .failure(error):
                self.interactorToPresenterProtocol.fetchedError(error)
            }
        }
    }

}
