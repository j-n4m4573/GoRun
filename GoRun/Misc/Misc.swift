//
//  Misc.swift
//  GoRun
//
//  Created by Jamar Gibbs on 10/11/21.
//

import Foundation


//                        List(weatherData.weather, id:\.id) { day in
//
//
//
//                            ZStack {
//
//                                RoundedRectangle(cornerRadius: 10)
//                                    .fill(LinearGradient(gradient: Gradient(colors: [.green, .blue]), startPoint: .topLeading, endPoint: .bottomTrailing))
//                                    .frame(height: 100)
//                                    .shadow(radius: 1, x: 1
//                                            , y: 3)
//                                    .opacity(0.8)
//                                    .zIndex(1)
//
//                                Image("running")
//                                    .resizable()
//                                    .frame(height: 100)
//                                    .aspectRatio(contentMode: .fit)
//                                    .cornerRadius(10)
//                                    .zIndex(0)
//
//                                Text("\(day.date)")
//                                    .foregroundColor(.white)
//                                    .zIndex(2.0)
//
//                            }
//
//
//                        }
//                        .frame(width: 300, height: 800, alignment: .center)
//                        LazyVGrid(columns: [GridItem(.adaptive(minimum: 300))]) {
//                            ForEach(weatherData.weather, id:\.id) { day in
//
//                                    Text("\(day.date)")
//
//                            }
////                        }
//                    }
//                }
          
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
