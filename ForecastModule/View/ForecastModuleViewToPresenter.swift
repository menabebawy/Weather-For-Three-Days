//
//  ForecastModuleViewToPresenter.swift
//  ForecastModule
//
//  Created by Mena Bebawy on 2/7/20.
//  Copyright © 2020 Mena. All rights reserved.
//

import Foundation

protocol ForecastModuleViewToPresenter {
    func viewIsLoading(cityId: Int)
    func viewIsReady()
}
