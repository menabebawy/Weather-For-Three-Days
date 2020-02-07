//
//  ForecastModuleCoordinator.swift
//  Weather-For-Three-Days
//
//  Created by Mena Bebawy on 2/7/20.
//  Copyright © 2020 Mena. All rights reserved.
//

import UIKit
import ForecastModule
import Entities

final class ForecastModuleCoordinator: Coordinator {
    var childCoordinators: [Coordinator] = []
    var city: City!
    unowned let navigationController: UINavigationController
    
    required init(navigationController: UINavigationController) {
        self.navigationController = navigationController
    }
    
    func start() {
        let nibName = String(describing: ForecastModuleViewController.self)
        let forecastViewController = ForecastModuleViewController(nibName: nibName, bundle: .main)
        forecastViewController.city = city
        navigationController.pushViewController(forecastViewController, animated: true)
    }
    
}
