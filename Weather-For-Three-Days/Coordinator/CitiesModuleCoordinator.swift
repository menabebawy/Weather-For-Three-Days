//
//  CitiesModuleCoordinator.swift
//  Weather-For-Three-Days
//
//  Created by Mena Bebawy on 2/6/20.
//  Copyright © 2020 Mena. All rights reserved.
//

import UIKit
import CitiesModule
import Entities
import Utils

final class CitiesModuleCoordinator: Coordinator {
    var childCoordinators: [Coordinator] = []
    unowned let navigationController: UINavigationController
    
    required init(navigationController: UINavigationController) {
        self.navigationController = navigationController
    }
    
    func start() {
        let nibName = String(describing: CitiesModuleViewController.self)
        let citiesViewController = CitiesModuleViewController(nibName: nibName, bundle: .main)
        citiesViewController.delegate = self
        navigationController.navigationBar.prefersLargeTitles = true
        navigationController.viewControllers = [citiesViewController]
    }

}

// MARK: - Cities module view controller delegate

extension CitiesModuleCoordinator: CitiesModuleViewControllerDelegate {
    func citiesModuleViewController(_ controller: CitiesModuleViewController, didSelectCity city: City) {
        let forecastModuleCoordinator = ForecastModuleCoordinator(navigationController: navigationController)
        forecastModuleCoordinator.city = city
        forecastModuleCoordinator.start()
    }
    
    func citiesModuleViewController(_ controller: CitiesModuleViewController,
                                    showErrorAlertWithMessage message: String) {
        navigationController.viewControllers[0].showErrorAlertController(withMessage: message)
    }
    
}
