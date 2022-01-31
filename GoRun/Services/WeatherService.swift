//
//  WeatherService.swift
//  GoRun
//
//  Created by Jamar Gibbs on 2/14/21.
//

import Foundation
import CoreLocation

protocol WeatherManager {
    func fetchWeather(latitude: Double, longitude: Double, completion: @escaping([Weather]?) -> ())
}

class WeatherService {
    
    func fetchWeather(latitude: Double, longitude: Double, completion: @escaping ([Weather]?) -> () ) {
        
        guard let url = URL(string: "https://api.openweathermap.org/data/2.5/onecall?lat=\(latitude)&lon=\(longitude)&exclude=minutely,hourly,alerts&appid=\(APIKeys.weatherKey)") else {
            completion(nil)
            return
        }
        
        let dataTask = URLSession.shared.dataTask(with: url) { data, response, error in
            
            if let error = error {
                debugPrint("network error: \(String(describing: error))")
                completion(nil)
                return
            }
            
            guard let response = response as? HTTPURLResponse, response.statusCode == 200 else {
                debugPrint("\(String(describing: response as? HTTPURLResponse))")
                completion(nil)
                return
            }
            
            guard let data = data else {
                completion(nil)
                return
            }
            
            do {
                let weatherResponse = try JSONDecoder().decode(WeatherResponse.self, from: data)
                let weather = weatherResponse.daily
                completion(weather)
                return
            } catch {
                debugPrint(error)
                completion(nil)
            }
        }
        dataTask.resume()
    }
}

extension WeatherService: WeatherManager {}

