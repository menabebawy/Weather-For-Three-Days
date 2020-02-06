//
//  CitiesModulePresenter.swift
//  CitiesModule
//
//  Created by Mena Bebawy on 2/6/20.
//  Copyright © 2020 Mena. All rights reserved.
//

import Entities

final class CitiesModulePresenter {
    weak var view: CitiiesModulePresenterToView!
    var interactor: CitiesModulePresenterToInteractor!
    
    private var citiesStringsArray: [String] {
        return ["Cairo", "Vienna", "Berlin", "Paris", "Madrid", "Montreal"]
    }
    
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
                3182749: "Tronto"]
    }
    
}

// MARK: - Cities module view to presenter

extension CitiesModulePresenter: CitiesModuleViewToPresenter {
    func viewIsLoading() {
        interactor.fetchCities(ids: LocalCitiesWithIDs.map { $0.key })
    }
    
    func viewIsReady() {
        view.viewTitle("Weather app")
        view.configureCitiesTableView()
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
    }
    
}
