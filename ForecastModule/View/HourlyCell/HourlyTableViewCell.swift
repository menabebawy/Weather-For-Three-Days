//
//  HourlyTableViewCell.swift
//  ForecastModule
//
//  Created by user165891 on 2/7/20.
//  Copyright © 2020 Mena. All rights reserved.
//

import UIKit

final class HourlyTableViewCell: UITableViewCell {
    @IBOutlet weak var collectionView: UICollectionView!
    
    static let identifier = "HourlyCell"
    static let height: CGFloat = 80
    
    
}

// MARK: - Collection view data source

extension HourlyTableViewCell: UICollectionViewDataSource {
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return 0
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        return UICollectionViewCell()
    }
    
}

// MARK: - Collection view delegate flow layout

extension HourlyTableViewCell: UICollectionViewDelegateFlowLayout {
    
}
