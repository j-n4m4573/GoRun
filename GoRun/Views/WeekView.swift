//
//  WeekView.swift
//  GoRun
//
//  Created by Jamar Gibbs on 7/15/21.
//

import SwiftUI

struct WeekView: View {
    @EnvironmentObject var weatherData: WeatherData
    @ObservedObject var viewModel: WeekViewModel
    @State var refresh: Bool = false
    
    init(weekViewModel: WeekViewModel) {
        self.viewModel = weekViewModel
    }
    
    var body: some View {
        GeometryReader { geometry in
            VStack(alignment: .center) {
                 
                    if weatherData.weather.isEmpty {
                        Text("weather data is empty 🤷🏾‍♂️")
                    } else {
                        WeekViewGrid(weekViewModel: viewModel)
                    }
            }
            .frame(width: geometry.size.width, height: geometry.size.height, alignment: .center)
        }
    }
}

struct WeekView_Previews: PreviewProvider {
    static var previews: some View {
        WeekView(weekViewModel: WeekViewModel())
    }
}

