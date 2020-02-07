//
//  ForecastModulePresenter.swift
//  ForecastModule
//
//  Created by Mena Bebawy on 2/7/20.
//  Copyright © 2020 Mena. All rights reserved.
//

import Foundation

final class ForecastModulePresenter {
    weak var view: ForecastModulePresenterToView!
    var interactor: ForecastModulePresenterToInteractor!
}

// MARK: - Forecast module view to presenter

extension ForecastModulePresenter: ForecastModuleViewToPresenter {
    func viewIsLoading() {
    }
    
    func viewIsReady() {
        view.setTitle()
    }
    
}

// MARK: - Forecast module presenter to interactor

extension ForecastModulePresenter: ForecastModuleInteractorToPresenter {
    
}
