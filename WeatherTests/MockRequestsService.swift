//
//  MockRequestsService.swift
//  WeatherTests
//
//  Created by vladikkk on 01/03/2023.
//

import Foundation

class MockRequestsService {
    let fileName: String
    private let decoder = JSONDecoder()
    
    init(fileName: String) {
        self.fileName = fileName
    }
    
    func getWeatherData() -> Bool {
        if let url = Bundle(for: type(of: self)).url(forResource: fileName, withExtension: "json") {
            do {
                let data = try Data(contentsOf: url)
                let decodedData = try decoder.decode(WeatherModel.self, from: data)
                return true
            } catch {
                return false
            }
        }
        
        return false
    }
}

