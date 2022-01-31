//
//  DisplayItems.swift
//  GoRun
//
//  Created by Jamar Gibbs on 1/28/22.
//

import Foundation

class DisplayItems: ObservableObject {
    @Published var days: [[WeatherReadout]]
    
    init() {
        self.days = [[]]
    }
}
