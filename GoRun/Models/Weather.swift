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
    var dt: Double?
    var rain: Double?
    var temp: Temp?

}

struct Temp: Decodable {
    var day: Double?
    var eve: Double?
    var morn: Double?
}

extension WeatherResponse: Identifiable {
    var id: UUID {return UUID() }
}

extension Weather: Identifiable {
    var id: UUID {return UUID() }
}
