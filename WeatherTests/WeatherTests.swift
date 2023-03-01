//
//  WeatherTests.swift
//  WeatherTests
//
//  Created by vladikkk on 28/02/2023.
//

import XCTest
@testable import Weather

final class WeatherTests: XCTestCase {
    func testWeatherDataFailure() {
        let service = MockRequestsService(fileName: "te")
        XCTAssertFalse(service.getWeatherData())
    }
    
    func testWeatherDataSuccess() {
        let service = MockRequestsService(fileName: "test")
        XCTAssertTrue(service.getWeatherData())
    }
    
    func testImageDownloadFail() {
        let imageDownloader = MockImageDownloader()
        
        XCTAssertFalse(imageDownloader.downloadImage(urlString: ""))
    }
    
    func testImageDownloadSuccess() {
        let imageDownloader = MockImageDownloader()
        
        XCTAssertTrue(imageDownloader.downloadImage(urlString: "https://"))
    }
    
    func testViewModel() {
        let viewModel = MainViewModel()
        
    }
}
