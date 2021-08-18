//
//  RootViewModel.swift
//  GoRun
//
//  Created by Jamar Gibbs on 7/15/21.
//

import UIKit
import Combine
import CoreLocation

class RootViewModel: ObservableObject {
    @Published var weather =  [Weather]()
    
    private var weatherService: WeatherService
    private var locationService: LocationService
    
    var latitude: Double? {
        return locationService.location.coordinate.latitude
    }
    
    var longitude: Double? {
        return locationService.location.coordinate.longitude
    }
    
    init() {
        self.weatherService = WeatherService()
        self.locationService = LocationService()
        
        fetchWeather()
        fetchLocation()
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
                }
            }
        }
    }
    
 
    
    
    
    
    
    
    
    
    
    
    
}
