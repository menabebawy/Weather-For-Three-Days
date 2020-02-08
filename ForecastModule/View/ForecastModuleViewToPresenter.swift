//
//  ForecastModuleViewToPresenter.swift
//  ForecastModule
//
//  Created by Mena Bebawy on 2/7/20.
//  Copyright © 2020 Mena. All rights reserved.
//

import Entities

protocol ForecastModuleViewToPresenter {
    func viewIsLoading(city: City)
    func viewIsReady()
}
