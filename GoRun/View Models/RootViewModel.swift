//
//  RootViewModel.swift
//  GoRun
//
//  Created by Jamar Gibbs on 7/15/21.
//

import SwiftUI
import Combine
import CoreLocation

class RootViewModel: ObservableObject {
    @Published var weather: [Weather] =  []
    @Published var displayItems: [[WeatherReadout]] = [[]]
    @Published var didFetch: Bool = false
    @Published var location: CLLocation
    
    private var weatherService: WeatherService
    private var locationService: LocationService
    
    var latitude: Double? {
        return locationService.location.coordinate.latitude
    }
    
    var longitude: Double? {
        return locationService.location.coordinate.longitude
    }
    
    init(weatherService: WeatherService, locationService: LocationService) {
        self.weatherService = weatherService
        self.locationService = locationService
        self.location = locationService.location
        
        fetchLocation()
        fetchWeather()
    }
    
    func fetchLocation() {
        locationService.startLocationServices()
    }
    
    func fetchWeather() {

        guard let latitude = self.latitude else {return}
        guard let longitude = self.longitude else {return}

        weatherService.fetchWeather(latitude: latitude, longitude: longitude) { [weak self] weather in
            if let weather = weather {
                DispatchQueue.main.async {
                    self?.weather = weather
                    self?.didFetch = true
                    self?.fetchDisplayItems(from: weather)
                }
            }
        }
    }
    
    func optimizePrecipitation(precipitation: Double) -> Precipitation {
        switch precipitation {
            case 0..<7.0:
                let precipitation = Precipitation.low
                return precipitation
            case 7.0..<8.0:
                let precipitation = Precipitation.medium
                return precipitation
            case 8.0...9.0:
                let precipitation = Precipitation.high
                return precipitation
            default:
                let precipitation = Precipitation.low
                return precipitation
        }
    }
    
    func optimizeWind(wind: Double) -> Wind {
        switch wind {
            case 0..<20.0:
                let wind = Wind.low
                return wind
        case 20.0..<30.0:
                let wind = Wind.medium
                return wind
        case 30..<80.0:
                let wind = Wind.high
                return wind
            default:
                let wind = Wind.low
                return wind
        }
    }
    
    func fetchDisplayItems(from weather: [Weather]) {
      
        weather.forEach { day in
            var displayDay: [WeatherReadout] = []
            
            let precipitation = day.precipitation
            displayDay.append(optimizePrecipitation(precipitation: precipitation))
            
            let wind = day.windSpeed
            displayDay.append(optimizeWind(wind: wind))
            
            displayItems.append(displayDay)
        }
    }
}

extension RootViewModel: LocationManager {}
