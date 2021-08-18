//
//  Weather.swift
//  GoRun
//
//  Created by Jamar Gibbs on 2/14/21.
//

import Foundation

struct WeatherResponse: Decodable {
    let daily: [Weather]
}

struct Weather: Decodable {
    var date: Double
    var windSpeed: Double
    var precipitation: Double
    var humidity: Double
    var temp: Temp
    
    enum CodingKeys: String, CodingKey {
        case date = "dt"
        case precipitation = "pop"
        case windSpeed = "wind_speed"
        case humidity
        case temp
    }
}

struct Temp: Decodable {
    var day: Double
    var eve: Double
    var morn: Double
}

extension WeatherResponse: Identifiable {
    var id: UUID {return UUID() }
}

extension Weather: Identifiable {
    var id: UUID {return UUID() }
}
