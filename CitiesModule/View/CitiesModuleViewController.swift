//
//  CitiiesModuleViewController.swift
//  CitiesModule
//
//  Created by Mena bebawy on 2/6/20.
//  Copyright © 2020 Mena. All rights reserved.
//

import UIKit
import Entities
import Utils

public protocol CitiesModuleViewControllerDelegate: class {
    func citiesModuleViewController(_ controller: CitiesModuleViewController,
                                    didSelectCity city: City)
    
    func citiesModuleViewController(_ controller: CitiesModuleViewController,
                                    showErrorAlertWithMessage message: String)
}

public class CitiesModuleViewController: UIViewController {
    @IBOutlet weak private var tableView: UITableView!
    
    private var cities: [City] = []
    
    weak var viewToPresenterProtocol: CitiesModulePresenter!
    public weak var delegate: CitiesModuleViewControllerDelegate?
    
    override public func loadView() {
        super.loadView()
        viewToPresenterProtocol.viewIsLoading()
    }
    
    override public func viewDidLoad() {
        super.viewDidLoad()
        viewToPresenterProtocol.viewIsReady()
    }
    
    override public func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        viewToPresenterProtocol.viewWillAppear()
    }
    
}

// MARK: - Cities module presenter to view

extension CitiesModuleViewController: CitiiesModulePresenterToView {
    func viewTitle(_ title: String) {
        self.title = title
    }
    
    func configureCitiesTableView() {
        tableView.register(CityTableViewCell.nib(), forCellReuseIdentifier: CityTableViewCell.identifier)
    }
    
    func deselectSelectedRow() {
        if let indexPath = tableView.indexPathForSelectedRow {
            tableView.deselectRow(at: indexPath, animated: false)
        }
    }
    
    func loadCitiesTableView(with cities: [City]) {
        self.cities = cities
        tableView.reloadData()
    }
    
    func showErrorAlert(withMessage message: String) {
        delegate?.citiesModuleViewController(self, showErrorAlertWithMessage: message)
    }
    
}

// MARK: - Table view data source

extension CitiesModuleViewController: UITableViewDataSource {
    public func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return cities.count
    }
    
    public func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        guard let cell = tableView.dequeueReusableCell(
            withIdentifier: CityTableViewCell.identifier, for: indexPath) as? CityTableViewCell else {
                return UITableViewCell()
        }
        
        cell.configure(city: cities[indexPath.row])
        return cell
    }
    
}

// MARK: - Table view delegate

extension CitiesModuleViewController: UITableViewDelegate {
    public func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        delegate?.citiesModuleViewController(self, didSelectCity: cities[indexPath.row])
    }
    
    public func tableView(_ tableView: UITableView, titleForHeaderInSection section: Int) -> String? {
        // Return without check indexPath section becasue we have Only one section
        return viewToPresenterProtocol.sectionTitle()
    }
    
    public func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return CityTableViewCell.height
    }
    
}
