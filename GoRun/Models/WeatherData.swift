//
//  WeatherData.swift
//  GoRun
//
//  Created by Jamar Gibbs on 9/30/21.
//

import UIKit

class WeatherData: ObservableObject {
    @Published var weather: [Weather]
    
    init() {
        self.weather = []
    }
}
