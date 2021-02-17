//
//  WeatherViewModel.swift
//  GoRun
//
//  Created by Jamar Gibbs on 2/14/21.
//

import Foundation
import Combine

class WeatherViewModel: ObservableObject {
    
    private var weatherService: WeatherService

    @Published var weather = [Weather]()
    
    init() {
        self.weatherService = WeatherService()
    }
    
    var cityName: String = "San Francisco"

    func formatDate(timeInt: TimeInterval) -> String {
        
        let date = Date(timeIntervalSince1970: timeInt)
        let dateFormatter = DateFormatter()
        dateFormatter.dateFormat = "EEE, MMMM d yyyy"
        
        return dateFormatter.string(from: date)
    }

    func formatTemp(temp: Double) -> String {
        return String(format: "%.0f", temp)
    }
    
    func search() {
        if let city = cityName.addingPercentEncoding(withAllowedCharacters: .urlHostAllowed) {
            fetchWeather(by: city)
        }
    }
    
    private func fetchWeather(by city: String) {
        
        self.weatherService.getWeather(city: city) { weather in
            if let weather = weather {
                DispatchQueue.main.async {
                    self.weather = weather
                }
            }
        }
    }
    
}
