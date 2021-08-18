//
//  WeatherViewModel.swift
//  GoRun
//
//  Created by Jamar Gibbs on 2/14/21.
//
import UIKit
import Combine

class WeatherViewModel: ObservableObject {
    
    private var weatherService: WeatherService

    @Published var weather = [Weather]()
 
    init() {
        self.weatherService = WeatherService()
    }
    
    var cityName: String = "San Francisco"
 
    func fetchWeather(by city: String) {
        
        self.weatherService.getWeather(city: city) { weather in
            if let weather = weather {
                DispatchQueue.main.async {
                    self.weather = weather
                }
            }
        }
    }
    
    func search() {
        if let city = cityName.addingPercentEncoding(withAllowedCharacters: .urlHostAllowed) {
            fetchWeather(by: city)
        }
    }
    
    
    func fetchIcons(for day: Weather) -> [UIImage] {
        var icons: [UIImage] = []
        
        weather.forEach { day in
            
            // check temp is optimal, add icon
            if day.temp.day > 80.00 {
                if let image = UIImage(named: "Sun") {
                    icons.append(image)
                }
            }
            // check wind is optimal, add icon
            if day.windSpeed > 0.5 {
                if let image = UIImage(named: "Wind") {
                    icons.append(image)
                }
            }
            // check if humidy is optimal, add icon
            if day.humidity > 0.9 {
                if let image = UIImage(named: "Humid") {
                    icons.append(image)
                }
            }
            // check if precipritation is optimal
            if day.precipitation > 0.9 {
                if let image = UIImage(named: "Rain") {
                    icons.append(image)
                }
            }
        }
        return icons
    }
    
    func formatDate(timeInt: TimeInterval) -> String {
        
        let date = Date(timeIntervalSince1970: timeInt)
        let dateFormatter = DateFormatter()
//        dateFormatter.dateFormat = "EEE, MMMM d yyyy"
        dateFormatter.dateFormat = "d E"
        
        return dateFormatter.string(from: date)
    }

    func formatTemp(temp: Double) -> String {
        return String(format: "%.0f", temp)
    }
    
}
