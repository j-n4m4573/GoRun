//
//  WeekView.swift
//  GoRun
//
//  Created by Jamar Gibbs on 7/15/21.
//

import SwiftUI

struct WeekView: View {
    @ObservedObject var weekViewModel: RootViewModel
    
    init(viewModel: RootViewModel) {
        self.weekViewModel = viewModel
    }
    
    var body: some View {
        GeometryReader { geometry in
            VStack {
                ScrollView {
                    Text("This Week")
                        .font(.system(size: 20, weight: .heavy, design: .default))
                        .position(x: 50, y: 20)
                        .foregroundColor(.gray)
                    
                    LazyVGrid(columns: [GridItem(.adaptive(minimum: 300))]) {
                        ForEach(weekViewModel.weather, id:\.id) { day in
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
                                        Text("Monday")
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
                                    
                                    Spacer()
                                    
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
                    }
                    .padding()
                }
                
//                List(weekViewModel.weather, id: \.id) { day in
//
//                    ZStack {
//                        Spacer()
//                        Rectangle()
//                            .fill(Color.white)
//                            .frame(width: geometry.size.width * 0.9, height: geometry.size.height * 0.10, alignment: .center)
//                            .zIndex(0.0)
//                        Text("\(day.humidity)")
//                            .zIndex(1.0)
//                    }
//                    .padding()
//                    .shadow(radius: 10)
//                    .cornerRadius(10)
//                    .background(Color.clear)
//                }
            }
        }
    }
}

struct WeekView_Previews: PreviewProvider {
    static var previews: some View {
        WeekView(viewModel: RootViewModel())
    }
}
