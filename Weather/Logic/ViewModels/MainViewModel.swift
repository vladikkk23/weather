//
//  MainViewModel.swift
//  Weather
//
//  Created by vladikkk on 28/02/2023.
//

import UIKit
import Combine

class MainViewModel {
    // MARK: - Properties
    @Published var locationData: WeatherLocationModel?
    @Published var currentWeatherData: CurrentWeatherModel?
    @Published var forecastData: [WeatherForecastDayModel]?
    var dataCounter = 0
    
    private let requestServices: RequestsService
    
    // MARK: - Initializers
    init() {
        requestServices = RequestsService()
        getWeatherData()
    }
    
    
    // MARK: - Methods
    func getWeatherData() {
        requestServices.getWeatherData { [weak self] result in
            guard let self = self else { return }
            
            switch result {
            case .failure(let error):
                print("Failed to get data with error: \(error)")
            case .success(let data):
                DispatchQueue.main.async {
                    self.dataCounter = data.forecast.forecastday.count
                    self.locationData = data.location
                    self.currentWeatherData = data.current
                    self.forecastData = data.forecast.forecastday
                }
            }
        }
    }
}
