//
//  CitiesModuleConfigurator.swift
//  CitiesModule
//
//  Created by Mena bebawy on 2/6/20.
//  Copyright © 2020 Mena. All rights reserved.
//

import Foundation

final class CitiesModuleConfigurator {
    
    func configureModuleForViewInput<UIViewController>(viewInput: UIViewController) {
        if let viewController = viewInput as? CitiesModuleViewController {
            configure(viewController: viewController)
        }
    }

    private func configure(viewController: CitiesModuleViewController) {
        let presenter = CitiesModulePresenter()
        presenter.view = viewController

        let interactor = CitiesModuleInteractor()
        interactor.interactorToPresenterProtocol = presenter

        presenter.interactor = interactor
        viewController.viewToPresenterProtocol = presenter
    }

}
