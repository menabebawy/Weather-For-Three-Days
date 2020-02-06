//
//  CitiesModuleCoordinator.swift
//  Weather-For-Three-Days
//
//  Created by Mena Bebawy on 2/6/20.
//  Copyright © 2020 Mena. All rights reserved.
//

import UIKit
import CitiesModule

final class CitiesModuleCoordinator: Coordinator {
    var childCoordinators: [Coordinator] = []
    unowned let navigationController: UINavigationController
    
    required init(navigationController: UINavigationController) {
        self.navigationController = navigationController
    }
    
    func start() {
        let nibName = String(describing: CitiesModuleViewController.self)
        let rendererViewController = CitiesModuleViewController(nibName: nibName, bundle: .main)
        navigationController.navigationBar.prefersLargeTitles = true
        navigationController.viewControllers = [rendererViewController]
    }

}
