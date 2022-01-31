//
//  RootViewController.swift
//  GoRun
//
//  Created by Jamar Gibbs on 7/15/21.
//

import SwiftUI
import CoreLocation

struct RootViewController: View {
    @ObservedObject var rootViewModel: RootViewModel
    
    init(rootViewModel: RootViewModel) {
        self.rootViewModel = rootViewModel
    }
    
    var body: some View {
        GeometryReader { geometry in
            NavigationView {
                ScrollView {
                    VStack {
                        
                        //MARK: DayView
                        DayView(dayViewModel: DayViewModel())
                            .frame(width: geometry.size.width - 20, height: geometry.size.height , alignment: .center)
                        
                        //MARK: WeekView
                        WeekView(weekViewModel: WeekViewModel())
                            .frame(width: geometry.size.width - 20, height: geometry.size.height / 2, alignment: .center)
                            .padding(.top, -390)
                    }
                }
                .navigationBarTitle("GoRun", displayMode: .large)
                    //MARK: Toolbar
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
        .onAppear {
            setupNav()
        }
    }
    
    func setupNav() {
        UINavigationBar.appearance().largeTitleTextAttributes = [.foregroundColor: UIColor.gray]
    }
}

struct RootViewController_Previews: PreviewProvider {
    static var previews: some View {
        RootViewController(rootViewModel: RootViewModel(weatherService: WeatherService(), locationService: LocationService()))
    }
}


