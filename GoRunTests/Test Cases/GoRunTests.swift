//
//  GoRunTests.swift
//  GoRunTests
//
//  Created by Jamar Gibbs on 2/13/21.
//

import XCTest
@testable import GoRun

class GoRunTests: XCTestCase {

    var viewModel: WeatherViewModel!

    override func setUp() {
        super.setUp()
        
        let data = loadStub(name: "openWeather", extension: "json")
        
        let decoder = JSONDecoder()
        
        decoder.dateDecodingStrategy = .secondsSince1970
        
        let weatherResponse = try! decoder.decode(WeatherResponse.self, from: data)
        
        viewModel.weather = weatherResponse.daily
    }
    
    override func tearDown() {
        super.tearDown()
    }
    
    func testDate() {
        
        guard let weather = viewModel.weather.first?.date else {return}

        XCTAssertEqual(viewModel.formatTemp(temp: weather), "Sun, February 14 2020")
    }
    
    func testTemperature() {
        
        guard let temp = viewModel.weather.first?.date else {return}

        XCTAssertEqual(temp, 52.4)
    }
    
    

}
