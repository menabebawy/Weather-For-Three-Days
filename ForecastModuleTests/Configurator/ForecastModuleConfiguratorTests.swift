//
//  ForecastModuleTests.swift
//  ForecastModuleTests
//
//  Created by Mena Bebawy on 2/9/20.
//  Copyright © 2020 Mena. All rights reserved.
//

import XCTest

class ForecastModuleTests: XCTestCase {
    
    func testConfigureModuleForViewController() {
        let viewController = ForecastModuleViewController()
        let configurator = ForecastModuleConfigurator()
        
        configurator.configureModuleForViewInput(viewInput: viewController)
        
        XCTAssertNotNil(viewController.viewToPresenterProtocol,
                        "CitiesModuleViewController is nil after configuration")
        
        let presenter = viewController.viewToPresenterProtocol!
        XCTAssertNotNil(presenter.view,"View in Presenter is nil after configuration")
        
        let interactor = presenter.interactor as! ForecastModuleInteractor
        XCTAssertNotNil(interactor.interactorToPresenterProtocol,
                        "Output in Interactor is nil after configuration")
    }

}
