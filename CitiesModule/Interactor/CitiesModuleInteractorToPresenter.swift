//
//  CitiesModuleInteractorToPresenter.swift
//  CitiesModule
//
//  Created by Mena Bebawy on 2/6/20.
//  Copyright © 2020 Mena. All rights reserved.
//

import Foundation
import Entities

protocol CitiesModuleInteractorToPresenter {
    func fetchedCities(_ cities: [City])
    func fetchedError(_ description: String)
}
