//
//  CurrentWeatherModel.swift
//  Weather
//
//  Created by vladikkk on 28/02/2023.
//

import Foundation

// MARK: - CurrentWeatherModel
struct CurrentWeatherModel: Codable {
    let tempC: Int
    let tempF: Double
    let isDay: Int
    let condition: WeatherConditionModel

    enum CodingKeys: String, CodingKey {
        case tempC = "temp_c"
        case tempF = "temp_f"
        case isDay = "is_day"
        case condition
    }
}
