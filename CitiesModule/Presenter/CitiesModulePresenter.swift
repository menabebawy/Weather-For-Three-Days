//
//  CitiesModulePresenter.swift
//  CitiesModule
//
//  Created by Mena Bebawy on 2/6/20.
//  Copyright © 2020 Mena. All rights reserved.
//

import Entities

final class CitiesModulePresenter {
    weak var view: CitiesModulePresenterToView!
    var interactor: CitiesModulePresenterToInteractor!
    
    private var LocalCitiesWithIDs: KeyValuePairs<Int, String> {
        return [360630: "Cairo",
                2761369: "Vienna",
                2950159: "Berlin",
                2988507: "Paris",
                3117735: "Madrid",
                2673730: "Stockholm",
                2643743: "London",
                250441: "Amman",
                6077243: "Montreal",
                6167865: "Tronto"]
    }
    
}

// MARK: - Cities module view to presenter

extension CitiesModulePresenter: CitiesModuleViewToPresenter {
    func viewIsLoading() {
        let idsString = LocalCitiesWithIDs.map { "\($0.key)" }.joined(separator: ",")
        interactor.fetchCities(idsString: idsString)
    }
    
    func viewIsReady() {
        view.viewTitle("Weather app")
        view.configureCitiesTableView()
    }
    
    func viewWillAppear() {
        view.deselectSelectedRow()
    }
    
    func sectionTitle() -> String {
        return "Cities"
    }
    
}

// MARK: - Cities module interactor to presenter

extension CitiesModulePresenter: CitiesModuleInteractorToPresenter {
    func fetchedCities(_ cities: [City]) {
        view.loadCitiesTableView(with: cities)
    }
    
    func fetchedError(_ description: String) {
        view.showErrorAlert(withMessage: description)
    }
    
}
