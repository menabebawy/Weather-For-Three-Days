//
//  ForecastModuleViewController.swift
//  ForecastModule
//
//  Created by Mena Bebawy on 2/7/20.
//  Copyright © 2020 Mena. All rights reserved.
//

import UIKit
import Entities

public final class ForecastModuleViewController: UIViewController {
    
    var viewToPresenterProtocol: ForecastModulePresenter!

    public var city: City!
    
    override public func loadView() {
        super.loadView()
        viewToPresenterProtocol.viewIsLoading()
    }

    override public func viewDidLoad() {
        super.viewDidLoad()
        viewToPresenterProtocol.viewIsReady()
    }

}

// MARK: - Forecast module presenter to view

extension ForecastModuleViewController: ForecastModulePresenterToView {
    func setTitle() {
        title = city.name
    }
}
