//
//  DayView.swift
//  GoRun
//
//  Created by Jamar Gibbs on 7/15/21.
//

import SwiftUI

struct DayView: View {
    @ObservedObject var viewModel: DayViewModel
    @EnvironmentObject var weatherData: WeatherData
    
    init(dayViewModel: DayViewModel) {
        self.viewModel = dayViewModel
    }
    
    var body: some View {
        GeometryReader { screen in
            ZStack {
                //  *** MainBackground Image ***
                Image("running")
                    .resizable()
                    .frame(height: screen.size.height / 2)
                    .aspectRatio(contentMode: .fit)
                    .cornerRadius(20)
                    .zIndex(0) // Background
                
                // *** MainBackground ***
                RoundedRectangle(cornerRadius: 20)
                    .fill(LinearGradient(gradient: Gradient(colors: [.blue, .green]), startPoint: .topLeading, endPoint: .bottomTrailing))
                    .frame(height: screen.size.height / 2)
                    .shadow(radius: 1, x: 2
                            , y: 4)
                    .opacity(0.8)
                    .zIndex(1)
                
                VStack() {
                    Image(systemName: "figure.walk")
                        .animation(.easeInOut(duration: 1))
                        .font(.system(size: 180))
                        .foregroundColor(.white)
                        .padding()
                        .position(x: 110, y: 200)
                     
                        .frame(width: 200, height: 200, alignment: .center)
                    
                    Text("GoRun")
                        .animation(.easeInOut(duration: 1))
                
                        .font(.system(size: 30, weight: .heavy, design: .default))
                        .foregroundColor(.white)
                        .position(x: 230, y: 120)
                    
                    Text("Optimal Weather")
                        .animation(.easeInOut(duration: 1))
                        .font(.system(size: 20, weight: .heavy, design: .default))
                        .position(x: 280, y: 50)
                        .foregroundColor(.gray)
                }
                .zIndex(2.0)
            }
            .frame(width: screen.size.width, height: screen.size.height / 2, alignment: .center)
        }
    }
}

struct DayView_Previews: PreviewProvider {
    static var previews: some View {
        DayView(dayViewModel: DayViewModel())
    }
}
