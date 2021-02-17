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
        
        viewModel = WeatherViewModel()
        
        guard let weather = viewModel.weather.first else {return}
        
    }
    
    override func tearDown() {
        super.tearDown()
    }
    
    func testDate() {
        XCTAssertEqual(weather.dt, "Sun, February 14 2020")
    }
    

    
    func testTemperature() {
        XCTAssertEqual(weather.temp, "52.4 °F")
    }
    
    func testImage() {
        let viewModelImage = viewModel.image
        let imageDataViewModel = viewModelImage!.pngData()!
        let imageDataRefrence = UIImage(named: "cloudy")!.pngData()
        
        XCTAssertNotNil(viewModelImage)
        XCTAssertEqual(viewModelImage!.size.width, 45.0)
        XCTAssertEqual(viewModelImage!.size.height, 33.0)
        XCTAssertEqual(imageDataViewModel, imageDataRefrence)
        
    }
    

}
