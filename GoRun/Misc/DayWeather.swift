//
//  DayWeather.swift
//  GoRun
//
//  Created by Jamar Gibbs on 7/15/21.
//

import UIKit

struct DayWeather {
    let days: [Day]
}

struct Day {
    let days: [DayViewReadout]
    let tempStatus: TempReadout
    let humidityStatus: HumidityReadout
    let windSpeedStatus: WindReadout
    let precipStatus: PrecipritationReadout
}

enum TempReadout: String {
    case HighTemp = "High Temperature"
    case AverageTemp = "Average Temperature"
    case LowTemp = "Low Temperature"
}

enum HumidityReadout: String {
    case HighHumidity = "High Humidity"
    case MedHumidity = "Medium Humidity"
    case LowHumidity = "Low Humidity"
}

enum WindReadout {
    case HighWind
    case MedWind
    case LowWind
}

enum PrecipritationReadout {
    case HighPrecipritation
    case MedPrecipritation
    case LowPrecipritaion
}

struct TempDay: DayViewReadout {
    var status: String
    var icon: UIImage
    var rawValue: Double
}

struct HumidityDay: DayViewReadout {
    var status: String
    var icon: UIImage
    var rawValue: Double
}

struct WindDay: DayViewReadout {
    var status: String
    var icon: UIImage
    var rawValue: Double
}

struct PrecipritationDay: DayViewReadout {
    var status: String
    var icon: UIImage
    var rawValue: Double
}
