//
//  CitiesModuleConfiguratorTests.swift
//  CitiesModuleTests
//
//  Created by Mena Bebawy on 2/8/20.
//  Copyright © 2020 Mena. All rights reserved.
//

import XCTest

class CitiesModuleConfiguratorTests: XCTestCase {

    func testConfigureModuleForViewController() {
        let viewController = CitiesModuleViewController()
        let configurator = CitiesModuleConfigurator()
        
        configurator.configureModuleForViewInput(viewInput: viewController)
        
        XCTAssertNotNil(viewController.viewToPresenterProtocol,
                        "CitiesModuleViewController is nil after configuration")
        
        let presenter = viewController.viewToPresenterProtocol!
        XCTAssertNotNil(presenter.view,"View in Presenter is nil after configuration")
        
        let interactor = presenter.interactor as! CitiesModuleInteractor
        XCTAssertNotNil(interactor.interactorToPresenterProtocol,
                        "Output in Interactor is nil after configuration")
    }

}
