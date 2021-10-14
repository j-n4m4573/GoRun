//
//  WeekView.swift
//  GoRun
//
//  Created by Jamar Gibbs on 7/15/21.
//

import SwiftUI

struct WeekView: View {
    @EnvironmentObject var weatherData: WeatherData
    @State var refresh: Bool = false
    
    init() {}
    
    var body: some View {
        GeometryReader { geometry in
            VStack {
                Text("This Week")
                    .font(.system(size: 20, weight: .heavy, design: .default))
                    .position(x: 20, y: 20)
                    .foregroundColor(.gray)
                    .frame(width: 100, height: 20)
               
                VStack {
                 
                    if weatherData.weather.isEmpty {
                        Text("weather data is empty 🤷🏾‍♂️")
                    } else {
                        WeekViewList()
                    }
                }
            }
        }
        .onAppear {
            
        }
    }
}

struct WeekView_Previews: PreviewProvider {
    static var previews: some View {
        WeekView()
    }
}

