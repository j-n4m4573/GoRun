//
//  WeekViewModel.swift
//  GoRun
//
//  Created by Jamar Gibbs on 7/15/21.
//
import SwiftUI

class WeekViewModel: ObservableObject {
    
    @Published var weather:  [Weather]
    
    init(weather: [Weather]) {
        self.weather = weather
    }
    
    
}
