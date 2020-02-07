//
//  ForecastModuleConfigurator.swift
//  ForecastModule
//
//  Created by user165891 on 2/7/20.
//  Copyright © 2020 Mena. All rights reserved.
//

import Foundation

final class ForecastModuleConfigurator {

    func configureModuleForViewInput<UIViewController>(viewInput: UIViewController) {
        if let viewController = viewInput as? ForecastModuleViewController {
            configure(viewController: viewController)
        }
    }

    private func configure(viewController: ForecastModuleViewController) {
        let presenter = ForecastModulePresenter()
        presenter.view = viewController
        
        let interactor = ForecastModuleInteractor()
        interactor.interactorToPresenterProtocol = presenter
        
        presenter.interactor = interactor
        viewController.viewToPresenterProtocol = presenter
    }

}
