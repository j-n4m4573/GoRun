//
//  WeekViewGrid.swift
//  GoRun
//
//  Created by Jamar Gibbs on 1/13/22.
//

import SwiftUI

struct WeekViewGrid: View {
    @EnvironmentObject var weatherData: WeatherData
    @EnvironmentObject var displayItems: DisplayItems
    @State var displayIndex: Int = 1

    var viewModel: WeekViewModel
    
    init(weekViewModel: WeekViewModel) {
        self.viewModel = weekViewModel
    }
    
    let layout = [
        GridItem(.adaptive(minimum: 150, maximum: 200))
    ]
    
    var body: some View {
        GeometryReader { geometry in
            ScrollView {
                LazyVGrid(columns: layout, spacing: 10) {
                    Section(header: Text("Current Week")) {
                        ForEach(weatherData.weather, id: \.id) { day in
                            
                            ZStack {
                                Image("running")
                                    .resizable()
                                    .frame(width: geometry.size.width / 2 - 10, height: geometry.size.height / 2)
                                    .aspectRatio(0.5, contentMode: .fit)
                                    .cornerRadius(20)
                                    .zIndex(0)
                                Rectangle()
                                    .fill(LinearGradient(gradient: Gradient(colors: [.blue, .green]), startPoint: .topLeading, endPoint: .bottomTrailing))
                                    .cornerRadius(20)
                                    .opacity(0.8)
                                    .zIndex(1)
                                    .frame(width: geometry.size.width / 2 - 10, height: geometry.size.height / 2)
                                 
                                VStack {
                                    HStack(alignment: .top) {
                                        Text("\(viewModel.formatDate(from: day.date))")
                                            .foregroundColor(.white)
                                            .bold()
                                            .font(.title)
                                            .shadow(radius: 1, x: 2, y: 2)
                                        Spacer()
                                    }
                                    .padding(EdgeInsets(top: 10, leading: 20, bottom: 0, trailing: 0))
                                   
                                    if !displayItems.days[1].isEmpty {
                                        Image(systemName: "\(displayItems.days[displayIndex][0].displayImageString)")
                                            .resizable()
                                            .aspectRatio(contentMode: .fit)
                                            .frame(width: 400, height: 70, alignment: .center)
                                            .foregroundColor(.white)
                                            .padding(EdgeInsets(top: 0, leading: 0, bottom: 5, trailing: 0))
                                            .shadow(radius: 1, x: 2, y: 4)
                                        
                                        Text("\(displayItems.days[displayIndex][0].displayText)")
                                            .frame(width: 200, height: 20, alignment: .center)
                                            .foregroundColor(.white)
                                            .font(.system(size: 15, weight: .bold, design: .default))
                                            .shadow(radius: 2, x: 2, y: 2)
                                        
                                        Text("Optimal Conditions")
                                            .frame(width: 200, height: 20, alignment: .center)
                                            .foregroundColor(.orange)
                                            .font(.system(size: 10, weight: .semibold, design: .default))
                                            .padding(.top, -10)

                                    } else {
                                        Image(systemName: "cloud")
                                            .resizable()
                                            .aspectRatio(contentMode: .fit)
                                            .frame(width: 400, height: 70, alignment: .center)
                                            .foregroundColor(.white)
                                            .padding(EdgeInsets(top: 0, leading: 0, bottom: 5, trailing: 0))
                                            .shadow(radius: 1, x: 2, y: 4)
                                        
                                        Text("Slight Rain")
                                            .frame(width: 200, height: 20, alignment: .center)
                                            .foregroundColor(.white)
                                            .font(.system(size: 15, weight: .bold, design: .default))
                                            .shadow(radius: 2, x: 2, y: 2)
                                        
                                        Text("Suboptimal Conditions")
                                            .frame(width: 200, height: 20, alignment: .center)
                                            .foregroundColor(.orange)
                                            .font(.system(size: 10, weight: .semibold, design: .default))
                                            .padding(.top, -10)
                                    }
                                     
                                }
                                .frame(width: 200, height: 100)
                                .zIndex(10)
                                .padding(.bottom, 10)
                            }
                        }
                    }
                    .foregroundColor(.gray)
                }
            }
        }
    }
    func updateDisplayIndex() {
        displayIndex = 1
    }
}

struct WeekViewGrid_Previews: PreviewProvider {
    static var previews: some View {
        WeekViewGrid(weekViewModel: WeekViewModel())
    }
}
