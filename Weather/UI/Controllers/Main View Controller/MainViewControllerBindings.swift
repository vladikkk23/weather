//
//  MainViewControllerBindings.swift
//  Weather
//
//  Created by vladikkk on 28/02/2023.
//

import Combine

typealias MainViewControllerBindings = MainViewController
extension MainViewControllerBindings {
    func setupBindings() {
        setupTodayWeatherViewBindings()
    }
    
    private func setupTodayWeatherViewBindings() {
        viewModel.$currentWeatherData.sink { [weak self] data in
            guard let self = self else { return }
            
            if let data = data {
                self.todayWeatherView.iconImage.downloadImage(urlString: data.condition.icon)
            }
        }
        .store(in: &cancellables)
        
        viewModel.$locationData.sink { [weak self] data in
            guard let self = self else { return }
            
            if let data = data {
                self.todayWeatherView.countryLabel.text = data.country
                self.todayWeatherView.cityLabel.text = data.name
                self.todayWeatherView.dateTimeLabel.text = data.localtimeEpoch.getDateStringFromUTC()
            }
        }
        .store(in: &cancellables)
        
        viewModel.$forecastData.sink { [weak self] data in
            guard let self = self else { return }
            
            if let data = data {
                self.weekForecastCollectionView.reloadData()
            }
        }
        .store(in: &cancellables)
    }
}
