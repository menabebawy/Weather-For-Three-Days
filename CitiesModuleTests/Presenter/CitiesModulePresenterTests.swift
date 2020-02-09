//
//  CitiesModulePresenterTests.swift
//  CitiesModuleTests
//
//  Created by Mena Bebawy on 2/8/20.
//  Copyright © 2020 Mena. All rights reserved.
//

import XCTest
import Entities

class CitiesModulePresenterTests: XCTestCase {
    let presenter = CitiesModulePresenter()
    var interactor: MockInteractor = MockInteractor()
    var view: MockView = MockView()
    
    override func setUp() {
        super.setUp()
        presenter.interactor = interactor
        presenter.view = view
    }
    
    func testSetTitle() {
        XCTAssertFalse(view.setTitle)
        presenter.viewIsReady()
        XCTAssertTrue(view.setTitle)
    }
    
    func testConfiguredCitiesTableView() {
        XCTAssertFalse(view.configuredTableView)
        presenter.viewIsReady()
        XCTAssertTrue(view.configuredTableView)
    }
    
    func testDeselectSelectedRow() {
        XCTAssertFalse(view.deselectedSelectedRow)
        presenter.viewWillAppear()
        XCTAssertTrue(view.deselectedSelectedRow)
    }
    
    func TestLoadCitiesTableView() {
        XCTAssertFalse(view.loadedCitiesTableView)
        presenter.fetchedCities([])
        XCTAssertTrue(view.loadedCitiesTableView)
    }
    
    func testShowAlert() {
        XCTAssertFalse(view.showedErrorAlert)
        presenter.fetchedError("error")
        XCTAssertTrue(view.showedErrorAlert)
    }
    
    func testFetchingCities() {
        presenter.viewIsLoading()
        XCTAssertTrue(interactor.fetchingCities)
    }
    
    class MockInteractor: CitiesModulePresenterToInteractor {
        var fetchingCities = false
        
        func fetchCities(idsString: String) {
            fetchingCities = true
        }
        
    }
    
    class MockView: CitiesModulePresenterToView {
        var setTitle = false
        var configuredTableView = false
        var deselectedSelectedRow = false
        var loadedCitiesTableView = false
        var showedErrorAlert = false
        
        func viewTitle(_ title: String) {
            setTitle = true
        }
        
        func configureCitiesTableView() {
            configuredTableView = true
        }
        
        func deselectSelectedRow() {
            deselectedSelectedRow = true
        }
        
        func loadCitiesTableView(with cities: [City]) {
            loadedCitiesTableView = true
        }
        
        func showErrorAlert(withMessage message: String) {
            showedErrorAlert = true
        }
    
    }

}
