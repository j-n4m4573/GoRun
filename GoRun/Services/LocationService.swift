//
//  LocationService.swift
//  GoRun
//
//  Created by Jamar Gibbs on 7/12/21.
//

import Foundation
import CoreLocation
import MapKit

class LocationService: NSObject, ObservableObject {
    
    @Published var location: CLLocation = {
        let location = CLLocation()
        return location
    }()
    
    private let locationManager: CLLocationManager = {
        let locationManager = CLLocationManager()
        locationManager.desiredAccuracy = kCLLocationAccuracyBest
        return locationManager
    }()
        
    override init() {
        super.init()
        locationManager.delegate = self
    }
    
    func startLocationServices() {
        if locationManager.authorizationStatus == .authorizedWhenInUse {
            locationManager.startUpdatingLocation()
        } else {
            locationManager.requestWhenInUseAuthorization()
        }
    }
}

extension LocationService: CLLocationManagerDelegate {
    
    func locationManagerDidChangeAuthorization(_ manager: CLLocationManager) {
        if locationManager.authorizationStatus == .authorizedWhenInUse {
            locationManager.startUpdatingLocation()
        }
    }
    
    func locationManager(_ manager: CLLocationManager, didUpdateLocations locations: [CLLocation]) {
        guard let latest = locations.first else { return}
        location = latest
    }
    
    func locationManager(_ manager: CLLocationManager, didFailWithError error: Error) {
        guard let clError = error as? CLError else {return}
    }
}
