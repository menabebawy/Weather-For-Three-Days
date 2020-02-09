//
//  CitiesModuleInteractorTests.swift
//  CitiesModuleTests
//
//  Created by Mena Bebawy on 2/8/20.
//  Copyright © 2020 Mena. All rights reserved.
//

import XCTest
import Entities
@testable import NetworkLayer

class CitiesModuleInteractorTests: XCTestCase {
    var interactorInterface = MockPresenter()
    var mockInteractor = CitiesModuleInteractor()
    
    override func setUp() {
        super.setUp()
        mockInteractor.interactorToPresenterProtocol = interactorInterface
    }
    
    func testFetchCitiesSuccessfully() {
        mockInteractor.interactorToPresenterProtocol.fetchedCities([])
        XCTAssertFalse(interactorInterface.didFailedLoading)
    }
    
    func testFetchCitiesFailure() {
        mockInteractor.interactorToPresenterProtocol.fetchedError("")
        XCTAssertTrue(interactorInterface.didFailedLoading)
    }
    
    class MockPresenter: CitiesModuleInteractorToPresenter {
        var didFailedLoading = true
        
        func fetchedCities(_ cities: [City]) {
            didFailedLoading = false
        }
        
        func fetchedError(_ description: String) {
            didFailedLoading = true
        }
        
    }

}
