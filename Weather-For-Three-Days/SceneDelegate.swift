//
//  SceneDelegate.swift
//  Weather-For-Three-Days
//
//  Created by user165891 on 2/6/20.
//  Copyright © 2020 Mena. All rights reserved.
//

import UIKit
import CitiesModule

class SceneDelegate: UIResponder, UIWindowSceneDelegate {

    var window: UIWindow?
    var citiesModuleCoordinator: CitiesModuleCoordinator!

    func scene(_ scene: UIScene, willConnectTo session: UISceneSession, options connectionOptions: UIScene.ConnectionOptions) {
        guard let windowScene = (scene as? UIWindowScene) else { return }
        
        window = UIWindow(frame: windowScene.coordinateSpace.bounds)
        window?.windowScene = windowScene
        window?.rootViewController = UINavigationController()
        
        citiesModuleCoordinator = CitiesModuleCoordinator(navigationController: window?.rootViewController as! UINavigationController)
        citiesModuleCoordinator.start()
        
        window?.makeKeyAndVisible()
    }

}
