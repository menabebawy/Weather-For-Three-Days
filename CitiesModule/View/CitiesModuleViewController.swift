//
//  CitiiesModuleViewController.swift
//  CitiesModule
//
//  Created by Mena bebawy on 2/6/20.
//  Copyright © 2020 Mena. All rights reserved.
//

import UIKit
import Entities

public class CitiesModuleViewController: UIViewController {
    @IBOutlet weak private var tableView: UITableView!
    
    var cities: [City] = []
    weak var viewToPresenterProtocol: CitiesModulePresenter!
    
    override public func loadView() {
        super.loadView()
        viewToPresenterProtocol.viewIsLoading()
    }

    override public func viewDidLoad() {
        super.viewDidLoad()
        viewToPresenterProtocol.viewIsReady()
    }

}

// MARK: - Cities module presenter to view

extension CitiesModuleViewController: CitiiesModulePresenterToView {
    func viewTitle(_ title: String) {
        self.title = title
    }
    
    func configureCitiesTableView() {
        tableView.register(UITableViewCell.self, forCellReuseIdentifier: "CityCell")
    }

    func loadCitiesTableView(with cities: [City]) {
        self.cities = cities
        tableView.reloadData()
    }
    
}

// MARK: - Table view data source

extension CitiesModuleViewController: UITableViewDataSource {
    public func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return cities.count
    }
    
    public func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "CityCell", for: indexPath)
        cell.textLabel?.text = cities[indexPath.row].name
        return cell
    }
    
}

// MARK: - Table view delegate

extension CitiesModuleViewController: UITableViewDelegate {
    public func tableView(_ tableView: UITableView, titleForHeaderInSection section: Int) -> String? {
        // Return without check indexPath section becasue we have Only one section
        return viewToPresenterProtocol.sectionTitle()
    }

}
