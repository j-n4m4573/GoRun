//
//  WeekViewList.swift
//  GoRun
//
//  Created by Jamar Gibbs on 10/11/21.
//

import SwiftUI

struct WeekViewList: View {
    @EnvironmentObject var weatherData: WeatherData
    
    var body: some View {

        GeometryReader { geometry in
            
            List(weatherData.weather, id:\.id) { day in
                    
                VStack {
                    ZStack {
                            Image("running")
                                .resizable()
                                .frame(height: 100)
                                .aspectRatio(contentMode: .fit)
                                .cornerRadius(10)
                                .zIndex(0)
                            
                            RoundedRectangle(cornerRadius: 10)
                                .fill(LinearGradient(gradient: Gradient(colors: [.green, .blue]), startPoint: .topLeading, endPoint: .bottomTrailing))
                                .frame(height: 100)
                                .shadow(radius: 1, x: 1
                                        , y: 3)
                                .opacity(0.8)
                                .zIndex(1)
                            
                            HStack {
                                VStack {
                                    Text("\(day.date)")
                                        .foregroundColor(.white)
                                        .bold()
                                        .font(.largeTitle)
                                        .position(x: 70, y: 30)
                                    Text("28")
                                        .foregroundColor(.gray)
                                        .bold()
                                        .font(.largeTitle)
                                        .position(x: 70, y: 10.0
                                        )
                                }
                                
                                HStack {
                                    Text(.init(systemName: "thermometer"))
                                        .foregroundColor(.white)
                                        .bold()
                                        .font(.title)
                                    Text(.init(systemName: "wind"))
                                        .foregroundColor(.white)
                                        .bold()
                                        .font(.title)
                                    Text(.init(systemName: "cloud.rain"))
                                        .foregroundColor(.white)
                                        .bold()
                                        .font(.title)
                                    
                                }
                                .frame(width: 120, height: 70)
                                .position(x: 100, y: 55)
                            }
                            .zIndex(2)
                    }
                }
                .frame(width: geometry.size.width, height: 100, alignment: .center)
            }
            .frame(width: geometry.size.width, height: geometry.size.height, alignment: .center)
        }
    }
}


struct WeekViewCell_Previews: PreviewProvider {
    static var previews: some View {
        WeekViewList()
    }
}
