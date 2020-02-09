//
//  ForecastModulePresenterTests.swift
//  ForecastModuleTests
//
//  Created by Mena Bebawy on 2/9/20.
//  Copyright © 2020 Mena. All rights reserved.
//

import XCTest
import Entities

class ForecastModulePresenterTests: XCTestCase {
    let presenter = ForecastModulePresenter()
    var interactor: MockInteractor = MockInteractor()
    var view: MockView = MockView()
    
    override func setUp() {
        super.setUp()
        presenter.interactor = interactor
        presenter.view = view
    }
    
    func testSetTitle() {
        XCTAssertFalse(view.isSetTitle)
        presenter.viewIsReady()
        XCTAssertTrue(view.isSetTitle)
    }
    
    func testConfiguredForecastsTableView() {
        XCTAssertFalse(view.configuredTableView)
        presenter.viewIsReady()
        XCTAssertTrue(view.configuredTableView)
    }
    
    func testShowAlert() {
        XCTAssertFalse(view.showedError)
        presenter.fetchedError("error")
        XCTAssertTrue(view.showedError)
    }
    
    func testFetchingCities() {
        presenter.viewIsLoading(cityId: 1)
        XCTAssertTrue(interactor.fetchingForecast)
    }
    
    class MockInteractor: ForecastModulePresenterToInteractor {
        var fetchingForecast = false
        
        func fetchForecast(cityId: String) {
            fetchingForecast = true
        }
        
    }
    
    class MockView: ForecastModulePresenterToView {
        var isSetTitle = false
        var configuredTableView = false
        var showedError = false
        
        func setTitle() {
            isSetTitle = true
        }
        
        func configureTableView() {
            configuredTableView = true
        }
        
        func loadHourlyForecasts(_ forecoasts: [Forecast]) {
        }
        
        func loadNextDaysForecasts(_ forecasts: [Forecast]) {
        }
        
        func showErrorAlert(withMessage message: String) {
            showedError = true
        }

    }

}
