//
//  ContentView.swift
//  GoRun
//
//  Created by Jamar Gibbs on 2/13/21.
//

import SwiftUI

struct ContentView: View {
    
    @ObservedObject private var weatherVM: WeatherViewModel
    @State private var runStatus: Bool = false
    @State private var runStatusText: String = "Exellent Conditions"
    
    init() {
        self.weatherVM = WeatherViewModel()
        getWeather()
        setupView()
    }
    
    var body: some View {
        NavigationView {
            ZStack {
                Image("run_1-1")
                    .resizable()
                    .aspectRatio(contentMode: .fill)
                    .ignoresSafeArea()
                    .zIndex(0)
                
                VStack {
                    LottieView()
                        .frame(width: 200, height: 200, alignment: .center)

                    Text(runStatusText)
                        .font(.custom("Helvetica", size: 30))
                        .foregroundColor(.white)
                        .fontWeight(.bold)
                        .shadow(radius: 10)
                        
                    List(weatherVM.weather, id: \.id) { day in
                        HStack {
                            let date = weatherVM.formatDate(timeInt: day.date)
                            Text(date)
                            Text("☀️")
                            Text("🌬")
                            Text("🥶")
                        }
                    }
                    .padding()
                }
            .zIndex(1)
            }
        }
    }
    
    private func getWeather() {
        weatherVM.search()
    }
    
    private func setupView() {
        UITableView.appearance().backgroundColor = .clear
        UINavigationBar.appearance().backgroundColor = .clear
        UINavigationBar.appearance().isHidden = true
    }
}


struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
