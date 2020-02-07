//
//  ForecastModuleInteractor.swift
//  ForecastModule
//
//  Created by Mena Bebawy on 2/7/20.
//  Copyright © 2020 Mena. All rights reserved.
//

import Foundation
import NetworkLayer

final class ForecastModuleInteractor {
    var interactorToPresenterProtocol: ForecastModuleInteractorToPresenter!
    let sessionProvider = URLSessionProvider()
}

// MARK: - Forecast module presenter to interactor

extension ForecastModuleInteractor: ForecastModulePresenterToInteractor {
    
}
