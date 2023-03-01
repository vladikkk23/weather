//
//  WeatherModel.swift
//  Weather
//
//  Created by vladikkk on 28/02/2023.
//

import Foundation

// MARK: - WeatherModel
struct WeatherModel: Codable {
    let location: WeatherLocationModel
    let current: CurrentWeatherModel
    let forecast: WeatherForecastModel
}
