//
//  CitiesModulePresenter.swift
//  CitiesModule
//
//  Created by Mena Bebawy on 2/6/20.
//  Copyright © 2020 Mena. All rights reserved.
//

import Foundation

final class CitiesModulePresenter {
    weak var view: CitiiesModulePresenterToView!
    var interactor: CitiesModulePresenterToInteractor!
    
}

// MARK: - Cities module view to presenter

extension CitiesModulePresenter: CitiesModuleViewToPresenter {
    
}

// MARK: - Cities module interactor to presenter

extension CitiesModulePresenter: CitiesModuleInteractorToPresenter {
    
}
