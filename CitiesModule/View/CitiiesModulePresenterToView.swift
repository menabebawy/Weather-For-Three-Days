//
//  CitiiesModulePresenterToView.swift
//  CitiesModule
//
//  Created by Mena Bebawy on 2/6/20.
//  Copyright © 2020 Mena. All rights reserved.
//

import Entities

protocol CitiiesModulePresenterToView: class {
    func viewTitle(_ title: String)
    func configureCitiesTableView()
    func deselectSelectedRow()
    func loadCitiesTableView(with cities: [City])
}
