//
//  CitiesModuleViewToPresenter.swift
//  CitiesModule
//
//  Created by Mena Bebawy on 2/6/20.
//  Copyright © 2020 Mena. All rights reserved.
//

import Foundation

protocol CitiesModuleViewToPresenter {
    func viewIsLoading()
    func viewIsReady()
    func sectionTitle() -> String
}
