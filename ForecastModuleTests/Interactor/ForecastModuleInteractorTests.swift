//
//  ForecastModuleInteractorTests.swift
//  ForecastModuleTests
//
//  Created by Mena Bebawy on 2/9/20.
//  Copyright © 2020 Mena. All rights reserved.
//

import XCTest
import Entities
@testable import NetworkLayer

class ForecastModuleInteractorTests: XCTestCase {
    var interactorInterface = MockPresenter()
    var mockInteractor = ForecastModuleInteractor()
    
    override func setUp() {
        super.setUp()
        mockInteractor.interactorToPresenterProtocol = interactorInterface
    }
    
    func testFetchCitiesSuccessfully() {
        mockInteractor.interactorToPresenterProtocol.fetchedForecasts([])
        XCTAssertFalse(interactorInterface.didFailedLoading)
    }
    
    func testFetchCitiesFailure() {
        mockInteractor.interactorToPresenterProtocol.fetchedError("error")
        XCTAssertTrue(interactorInterface.didFailedLoading)
    }
    
    class MockPresenter: ForecastModuleInteractorToPresenter {
        var didFailedLoading = true
        
        func fetchedForecasts(_ forecasts: [Forecast]) {
            didFailedLoading = false
        }
        
        func fetchedError(_ description: String) {
            didFailedLoading = true
        }
        
        
        
    }
}
