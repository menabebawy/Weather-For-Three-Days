//
//  CitiesModuleInitalizer.swift
//  CitiesModule
//
//  Created by Mena Bebawy on 2/6/20.
//  Copyright © 2020 Mena. All rights reserved.
//

import Foundation

final class CitiesModuleInitalizer: NSObject {
    @IBOutlet weak private var citiesModuleViewController: CitiesModuleViewController!

    override func awakeFromNib() {
        super.awakeFromNib()
        let configurator = CitiesModuleConfigurator()
        configurator.configureModuleForViewInput(viewInput: citiesModuleViewController)
    }

}
