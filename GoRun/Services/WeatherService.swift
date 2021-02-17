//
//  WeatherService.swift
//  GoRun
//
//  Created by Jamar Gibbs on 2/14/21.
//

import Foundation

class WeatherService {
    
    func getWeather(city: String, completion: @escaping ([Weather]?) -> ()) {
        
        guard let url = URL(string: "https://api.openweathermap.org/data/2.5/onecall?lat=37.7576171&lon=-122.5776844&exclude=minutely,hourly,alerts&appid=\(APIKeys.weatherKey)") else { completion(nil)
            return
        }
        
        URLSession.shared.dataTask(with: url) { data, response, error in
            
            guard let data = data, error == nil else {
                debugPrint("network error: \(String(describing: error))")
                completion(nil)
                return
            }
            let weatherResponse = try? JSONDecoder().decode(WeatherResponse.self, from: data)
            if let weatherResponse = weatherResponse {
                let weather = weatherResponse.daily
                completion(weather)
            } else {
                completion(nil)
            }
        }.resume()
    }
}

