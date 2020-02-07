//
//  ForecastModuleIntializer.swift
//  ForecastModule
//
//  Created by Mena Bebawy on 2/7/20.
//  Copyright © 2020 Mena. All rights reserved.
//

import Foundation

final class ForecastModuleIntializer: NSObject {
    @IBOutlet weak private var forecastModuleViewController: ForecastModuleViewController!

    override func awakeFromNib() {
        super.awakeFromNib()
        let configurator = ForecastModuleConfigurator()
        configurator.configureModuleForViewInput(viewInput: forecastModuleViewController)
    }

}
