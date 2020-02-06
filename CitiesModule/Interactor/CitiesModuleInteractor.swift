//
//  CitiesModuleInteractor.swift
//  CitiesModule
//
//  Created by Mena bebawy on 2/6/20.
//  Copyright © 2020 Mena. All rights reserved.
//

import Foundation
import  NetworkLayer

final class CitiesModuleInteractor {
    var interactorToPresenterProtocol: CitiesModuleInteractorToPresenter!
    let sessionProvider = URLSessionProvider()
}

// MARK: - Cities module presenter to interactor

extension CitiesModuleInteractor: CitiesModulePresenterToInteractor {
}
