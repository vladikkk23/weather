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
        fetchData()
    }
    
    
    // MARK: - Methods
    func fetchData() {
        if let documentDirectory = FileManager.default.urls(for: .documentDirectory, in: .userDomainMask).first {
            let pathWithFileName = documentDirectory.appendingPathComponent("weatherJsonData")
            do {
                let data = try Data(contentsOf: pathWithFileName)
                let decoder = JSONDecoder()
                let decodedData = try decoder.decode(WeatherModel.self, from: data)
                
                if let first = decodedData.forecast.forecastday.first {
                    let stringDate = first.date.getDateStringFromUTC()
                    let todayDate = Date().timeIntervalSince1970.getDateStringFromUTC()
                    
                    if stringDate != todayDate {
                        getWeatherData()
                    }
                }
                
                DispatchQueue.main.async {
                    self.dataCounter = decodedData.forecast.forecastday.count
                    self.locationData = decodedData.location
                    self.currentWeatherData = decodedData.current
                    self.forecastData = decodedData.forecast.forecastday
                }
            } catch {
                print("No local data. Fetching from server")
                getWeatherData()
                return
            }
        } else {
            getWeatherData()
        }
    }
    
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
