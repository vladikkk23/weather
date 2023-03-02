//
//  WeatherLocationModel.swift
//  Weather
//
//  Created by vladikkk on 28/02/2023.
//

import Foundation

// MARK: - WeatherLocationModel
struct WeatherLocationModel: Codable {
    let name, region, country: String
    let lat, lon: Double
    let localtime: Double
    
    enum CodingKeys: String, CodingKey {
        case name, region, country, lat, lon
        case localtime = "localtime_epoch"
    }
}
