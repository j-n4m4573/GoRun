//
//  RootViewController.swift
//  GoRun
//
//  Created by Jamar Gibbs on 7/15/21.
//

import SwiftUI
import CoreLocation

struct RootViewController: View {
    @StateObject var rootViewModel =  RootViewModel()
    @StateObject var weatherData = WeatherData()
    @State var refresh: Bool = false

    init() {}
    
    var body: some View {
        GeometryReader { geometry in
            NavigationView {
                ScrollView {
                    VStack {
                        
                        //MARK: DayView
                        DayView()
                            .frame(width: geometry.size.width, height: geometry.size.height , alignment: .center)
                        
                        //MARK: WeekView
                        WeekView()
                            .frame(width: geometry.size.width, height: geometry.size.height / 2, alignment: .center)
                    }
                }
                .navigationBarTitle("GoRun", displayMode: .large)
                
                .toolbar {
                    ToolbarItem(placement: .navigationBarLeading) {
                            HStack {
                                Image(systemName: "sun.min.fill")
                                Text("Today is a good day for running")
                                    .font(.headline)
                                    .foregroundColor(.orange)
                            }
                    }
                }
            }
        }
        .environmentObject(weatherData)
        .onAppear {
            setupNav()
            setupViews()
        }
    }
     
    func setupViews() {
        weatherData.weather = rootViewModel.weather.map{$0}
    }
    
    func setupNav() {
        UINavigationBar.appearance().largeTitleTextAttributes = [.foregroundColor: UIColor.gray]
    }
}

struct RootViewController_Previews: PreviewProvider {
    static var previews: some View {
        RootViewController()
    }
}


