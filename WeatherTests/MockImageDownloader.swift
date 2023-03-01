//
//  MockImageDownloader.swift
//  WeatherTests
//
//  Created by vladikkk on 01/03/2023.
//

import Foundation

class MockImageDownloader {
    func downloadImage(urlString: String) -> Bool {
        if !urlString.isEmpty,
           urlString.contains("https") {
            return true
        }
        
        return false
    }
}
