//
//  MainViewControllerLayout.swift
//  Weather
//
//  Created by vladikkk on 28/02/2023.
//

import UIKit


// MARK: - MainViewController Layouts
typealias MainViewControllerLayout = MainViewController
extension MainViewControllerLayout {
    internal func setupLayout() {
        setupBackgroundImageViewLayout()
        setupTodayWeatherViewLayout()
        setupWeekForecastCollectionViewLayout()
    }
    
    private func setupBackgroundImageViewLayout() {
        view.addSubview(backgroundImageView)
        
        NSLayoutConstraint.activate([
            backgroundImageView.centerXAnchor.constraint(equalTo: view.centerXAnchor),
            backgroundImageView.centerYAnchor.constraint(equalTo: view.centerYAnchor),
            backgroundImageView.widthAnchor.constraint(equalTo: view.widthAnchor),
            backgroundImageView.heightAnchor.constraint(equalTo: view.heightAnchor)
        ])
    }
    
    private func setupTodayWeatherViewLayout() {
        view.addSubview(todayWeatherView)
        
        NSLayoutConstraint.activate([
            todayWeatherView.centerXAnchor.constraint(equalTo: view.centerXAnchor),
            todayWeatherView.topAnchor.constraint(equalTo: view.topAnchor, constant: 36),
            todayWeatherView.widthAnchor.constraint(equalTo: view.widthAnchor),
            todayWeatherView.heightAnchor.constraint(equalTo: view.widthAnchor, multiplier: 0.75)
        ])
    }
    
    private func setupWeekForecastCollectionViewLayout() {
        view.addSubview(weekForecastCollectionView)
        
        NSLayoutConstraint.activate([
            weekForecastCollectionView.centerXAnchor.constraint(equalTo: view.centerXAnchor),
            weekForecastCollectionView.widthAnchor.constraint(equalTo: view.widthAnchor),
            weekForecastCollectionView.topAnchor.constraint(equalTo: todayWeatherView.bottomAnchor, constant: 60),
            weekForecastCollectionView.bottomAnchor.constraint(equalTo: view.bottomAnchor)
        ])
    }
}
