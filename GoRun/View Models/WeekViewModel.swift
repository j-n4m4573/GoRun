//
//  WeekViewModel.swift
//  GoRun
//
//  Created by Jamar Gibbs on 7/15/21.
//
import SwiftUI

class WeekViewModel: ObservableObject {
    
    private let dateFormatter = DateFormatter()
    
    func formatDate(from dateDouble: Double) -> String {
        let date = Date(timeIntervalSince1970: dateDouble)
        dateFormatter.dateFormat = "EEEEE"
        return dateFormatter.string(from: date)
    }

    func formatTemp(from tempDouble: Double) -> String {
        return String(format: "%.1f °F", tempDouble)
    }

    func formatWindSpeed(from windDouble: Double) -> String {
        return String(format: "%.f MPH", windDouble)
    }
    
    
}
