//
//  MainViewControllerDelegates.swift
//  Weather
//
//  Created by vladikkk on 01/03/2023.
//

import UIKit

typealias MainViewControllerDelegates = MainViewController
extension MainViewControllerDelegates: UICollectionViewDelegateFlowLayout, UICollectionViewDataSource {
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        CGSize(width: collectionView.frame.width, height: collectionView.frame.height / CGFloat(viewModel.dataCounter) * 0.35)
    }
    
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        viewModel.dataCounter
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        guard let cell = collectionView.dequeueReusableCell(withReuseIdentifier: WeekForecastCollectionViewCell.reuseIdentifier, for: indexPath) as? WeekForecastCollectionViewCell else {
            return UICollectionViewCell()
        }
        
        // TO DO: Setup cell data
        guard let forecastData = viewModel.forecastData?[indexPath.row] else {
            return UICollectionViewCell()
        }
        
        cell.setupCellData(data: forecastData)
        
        return cell
    }
}
