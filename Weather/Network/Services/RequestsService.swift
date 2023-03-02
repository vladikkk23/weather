//
//  RequestsService.swift
//  Weather
//
//  Created by vladikkk on 28/02/2023.
//

import Foundation

class RequestsService {
    // MARK: - Properties
    private let baseURLString = "http://api.weatherapi.com/v1/forecast.json?key=522db6a157a748e2996212343221502&q=Chisinau&days=7&aqi=no&alerts=no"
    
    
    // MARK: - Methods
    func getWeatherData(completion: @escaping (Result<WeatherModel, Error>)  -> Void) {
        guard let url = URL(string: baseURLString) else {
            print("Failed to create base URL\n\(#function)")
            return
        }
        
        let task = URLSession.shared.dataTask(with: url) {(data, response, error) in
            if let error = error {
                print("Request failed with error: \(error.localizedDescription)")
                completion(.failure(error))
            }
            
            if let response = response as? HTTPURLResponse, (200...299).contains(response.statusCode) {
                guard let data = data else { return }
                
                let decoder = JSONDecoder()
                guard let decodedData = try? decoder.decode(WeatherModel.self, from: data) else {
                    print("Decoding failed\n\(#function)")
                    return
                }
                
                if let documentDirectory = FileManager.default.urls(for: .documentDirectory, in: .userDomainMask).first {
                    let pathWithFileName = documentDirectory.appendingPathComponent("weatherJsonData")
                    do {
                        try data.write(to: pathWithFileName)
                    } catch {
                        print("Failed to save data \(#function)")
                    }
                }
                
                completion(.success(decodedData))
            }
        }
        
        task.resume()
    }
}
