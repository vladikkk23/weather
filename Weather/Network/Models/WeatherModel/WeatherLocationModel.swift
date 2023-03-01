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
    let tzID: String
    let localtimeEpoch: Double
    let localtime: String
    
    enum CodingKeys: String, CodingKey {
        case name, region, country, lat, lon
        case tzID = "tz_id"
        case localtimeEpoch = "localtime_epoch"
        case localtime
    }
}
