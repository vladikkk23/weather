//
//  WeatherForecastModel.swift
//  Weather
//
//  Created by vladikkk on 28/02/2023.
//

import Foundation

// MARK: - WeatherForecastModel
struct WeatherForecastModel: Codable {
    let forecastday: [WeatherForecastDayModel]
}

// MARK: - WeatherForecastdayModel
struct WeatherForecastDayModel: Codable {
    let date: String
    let day: WeatherDayModel
    
    enum CodingKeys: String, CodingKey {
        case date
        case day
    }
}

// MARK: - WeatherDayModel
struct WeatherDayModel: Codable {
    let maxtempC, maxtempF, mintempC, mintempF: Double
    let condition: WeatherConditionModel
    
    enum CodingKeys: String, CodingKey {
        case maxtempC = "maxtemp_c"
        case maxtempF = "maxtemp_f"
        case mintempC = "mintemp_c"
        case mintempF = "mintemp_f"
        case condition
    }
}

// MARK: - WeatherConditionModel
struct WeatherConditionModel: Codable {
    let text: String
    let icon: String
    let code: Int
}
