//
//  GoRunTests.swift
//  GoRunTests
//
//  Created by Jamar Gibbs on 2/13/21.
//

import XCTest
@testable import GoRun
import CoreLocation

class GoRunTests: XCTestCase {
    
    let location: CLLocation = CLLocation(latitude: 37.8029308, longitude: -122.4519727)
    let rootViewModel: RootViewModel =  RootViewModel(weatherService: WeatherService(), locationService: LocationService())
    let weekViewModel: WeekViewModel = WeekViewModel()

    override func setUp() {
        super.setUp()
        
        let data = loadStub(name: "openWeather", extension: "json")
        let decoder = JSONDecoder()
        let weatherResponse = try! decoder.decode(WeatherResponse.self, from: data)
        
        }
    
    override func tearDown() {
        super.tearDown()
    }
    
    func test_optimizePrecipitation() {
        let precipitation = 23.45
        let optimizedPreciptation = rootViewModel.optimizePrecipitation(precipitation: precipitation)
        XCTAssertEqual(optimizedPreciptation, Precipitation.low)
        XCTAssertNotNil(optimizedPreciptation)
    }
    
    func test_optimizeWind() {
        let wind = 30.10
        let optimizedWind = rootViewModel.optimizeWind(wind: wind)
        XCTAssertEqual(optimizedWind, Wind.high)
        XCTAssertNotNil(optimizedWind)
    }
    
    func test_FetchDisplayItems() {
        let displayItems: [WeatherReadout] = [Precipitation.low, Wind.high]
        let fetchedDisplayItems = rootViewModel.fetchDisplayItems(from: displayItems)
        XCTAssertEqual(displayItems, fetchedDisplayItems)
        XCTAssertNotNil(fetchedDisplayItems)
    }
    
    func test_formatDate() {
        let date = 1643486400.0
        let formattedDate = weekViewModel.formatDate(from: date)
        XCTAssertEqual(formattedDate, "S")
        XCTAssertNotNil(formattedDate)
    }
    
    func test_formatTemp() {
        let temp = 55.31
        let formattedTemp = weekViewModel.formatTemp(from: temp)
        XCTAssertEqual(formattedTemp, "55°F")
        XCTAssertNotNil(formattedTemp)
    }
    
    func test_formatWindSpeed() {
        let windSpeed = 11.83
        let formattedWindSpeed = weekViewModel.formatWindSpeed(from: windSpeed)
        XCTAssertEqual(formattedWindSpeed, "11 MPH")
        XCTAssertNotNil(formattedWindSpeed)
    }
}
