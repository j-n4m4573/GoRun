//
//  GoRunApp.swift
//  GoRun
//
//  Created by Jamar Gibbs on 2/13/21.
//

import SwiftUI

@main
struct GoRunApp: App {
    
    @Environment(\.scenePhase) var scenePhase
    
    private var viewModel: RootViewModel = RootViewModel(weatherService: WeatherService(), locationService: LocationService())
    private var weatherData: WeatherData = WeatherData()
    private var displayItems: DisplayItems = DisplayItems()
    
    var body: some Scene {
        WindowGroup {
            RootViewController(rootViewModel: viewModel)
                .environmentObject(weatherData) // adds weatherData to environment
                .environmentObject(displayItems) // adds displayItems
                .onChange(of: viewModel.weather) { weather in
                    setupViews()
                }
        }
    }
    
    private func setupViews() {
        DispatchQueue.main.asyncAfter(deadline: .now() + 0.3) {
            weatherData.weather = viewModel.weather.map {$0}
            displayItems.days = viewModel.displayItems.map {$0}
        }
    }
}
