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
    @State private var runStatusText: String = ""
    
    init() {
        self.weatherVM = WeatherViewModel()
        getWeather()
    }
    
    var body: some View {
        NavigationView {
            VStack {
                if runStatus {
                    Circle()
                        .frame(width: 200, height: 200, alignment: .center)
                        .foregroundColor(.green)
                } else {
                    Circle()
                        .frame(width: 200, height: 200, alignment: .center)
                        .foregroundColor(.orange)
                }
                
                Text(runStatusText)
                    .font(.custom("Helvetica", size: 30))
                    .foregroundColor(.gray)
                    .padding()
                
                List {
                    ForEach(weatherVM.weather) { item in
                        if item.rain ?? 0 > 0 {
                            HStack {
                                Circle()
                                    .frame(width: 20, height: 20, alignment: .center)
                                    .foregroundColor(.orange)
                                if let date = weatherVM.formatDate(timeInt: item.dt ?? 0) {
                                    Text("\(date)")
                                    .frame(maxWidth: .infinity, alignment: .center)
                                    .foregroundColor(.gray)
                                }
                            }
                        } else {
                            HStack {
                                Circle()
                                    .frame(width: 20, height: 20, alignment: .center)
                                    .foregroundColor(.green)
                                
                                if let date = weatherVM.formatDate(timeInt: item.dt ?? 0) {
                                    Text("\(date)")
                                    .frame(maxWidth: .infinity, alignment: .center)
                                    .foregroundColor(.gray)
                                }
                            }
                        }
                    }
                }
                .padding()
                .frame(minWidth: 0, maxWidth: 450, minHeight: 0, maxHeight: 450)
            }
            .frame(minWidth: 0, maxWidth: .infinity, minHeight: 0, maxHeight: .infinity)
            .background(Color.yellow)
            .ignoresSafeArea(.all)
        }
    }
    
    private func getWeather() {
        weatherVM.search()
    }
    
    private func setupView() {
        UITableView.appearance().backgroundColor = .gray
    }
}


struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
