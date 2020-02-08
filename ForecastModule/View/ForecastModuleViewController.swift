//
//  ForecastModuleViewController.swift
//  ForecastModule
//
//  Created by Mena Bebawy on 2/7/20.
//  Copyright © 2020 Mena. All rights reserved.
//

import UIKit
import Entities
import Utils

public final class ForecastModuleViewController: UIViewController {
    @IBOutlet weak private var tableView: UITableView!
    
    private var forecasts: [Forecast] = []
    
    var viewToPresenterProtocol: ForecastModulePresenter!

    public var city: City!
    
    override public func loadView() {
        super.loadView()
        viewToPresenterProtocol.viewIsLoading(city: city)
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
    
    func configureTableView() {
        tableView.tableFooterView = UIView()
        tableView.register(CurrentTemperatureTableViewCell.nib(),
                           forCellReuseIdentifier: CurrentTemperatureTableViewCell.identifier)
        tableView.register(HourlyTableViewCell.nib(),
                           forCellReuseIdentifier: HourlyTableViewCell.identifier)
    }
    
    func loadHourlyForecasts(_ forecasts: [Forecast]) {
        self.forecasts = forecasts
        let hourlyIndexPath = IndexPath(row: 0, section: 1)
        tableView.reloadRows(at: [hourlyIndexPath], with: .none)
    }

}

// MARK: - Table view data source

extension ForecastModuleViewController: UITableViewDataSource {
    public func numberOfSections(in tableView: UITableView) -> Int {
        return 3
    }

    public func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        switch section {
        case 0:
            return 1
        case 1:
            return 1
        default:
            break
        }
        
        return 0
    }
    
    public func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        switch indexPath.section {
        case 0:
            guard let cell = tableView.dequeueReusableCell(withIdentifier: CurrentTemperatureTableViewCell.identifier, for: indexPath) as? CurrentTemperatureTableViewCell else {
                return UITableViewCell()
            }
            cell.configure(city: city)
            return cell
        case 1:
            guard let cell = tableView.dequeueReusableCell(withIdentifier: HourlyTableViewCell.identifier, for: indexPath) as? HourlyTableViewCell else {
                return UITableViewCell()
            }
            cell.configure(forecasts: self.forecasts)
            return cell
        default:
            return UITableViewCell()
        }
    }
    
    
}

// MARK: - Table view delegate

extension ForecastModuleViewController: UITableViewDelegate {
    public func tableView(_ tableView: UITableView, titleForHeaderInSection section: Int) -> String? {
        switch  section {
        case 0:
            return "Now"
        case 1:
            return "Hourly"
        default:
            return "Next 3 days"
        }
    }
    
    public func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        switch indexPath.section {
        case 0:
            return CurrentTemperatureTableViewCell.height
        case 1:
            return HourlyTableViewCell.height
        default:
            return 0
        }
    }
}
