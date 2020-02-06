//
//  CitiiesModuleViewController.swift
//  CitiesModule
//
//  Created by Mena bebawy on 2/6/20.
//  Copyright © 2020 Mena. All rights reserved.
//

import UIKit

public class CitiesModuleViewController: UIViewController {
    
    weak var viewToPresenterProtocol: CitiesModulePresenter!

    override public func viewDidLoad() {
        super.viewDidLoad()
        title = "Weather app"
    }

}

// MARK: - Cities module presenter to view

extension CitiesModuleViewController: CitiiesModulePresenterToView {
    
}
