//
//  WeatherReadout.swift
//  GoRun
//
//  Created by Jamar Gibbs on 1/10/22.
//

import UIKit

import UIKit
import SwiftUI

protocol WeatherReadout {
    var displayText: String {get}
    var displayImageString: String {get}
}

enum Precipitation: WeatherReadout {
    case low
    case medium
    case high
    
    var displayText: String {
        switch self {
        case .high:
            return "high precipitation"
        case .medium:
            return "med precipitation"
        case .low:
            return "GoRun"
        }
    }
    
    var displayImageString: String {
        switch self {
        case .high:
            return "cloud.heavyrain"
        case .medium:
            return "cloud.rain"
        case .low:
            return "figure.walk"
        }
    }
}

enum Wind: WeatherReadout {
    case low
    case medium
    case high
    
    var displayText: String {
        switch self {
        case .high:
            return "high precipitation"
        case .medium:
            return "med precipitation"
        case .low:
            return "GoRun"
        }
    }
    
    var displayImageString: String {
        switch self {
        case .high:
            return "wind"
        case .medium:
            return "wind"
        case .low:
            return "figure.walk"
        }
    }
}







