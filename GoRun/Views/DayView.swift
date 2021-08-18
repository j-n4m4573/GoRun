//
//  DayView.swift
//  GoRun
//
//  Created by Jamar Gibbs on 7/15/21.
//

import SwiftUI

struct DayView: View {
    @ObservedObject var dayViewModel: DayViewModel
    
    init(viewModel: DayViewModel) {
        self.dayViewModel = viewModel
        setupNav()
    }
    
    var body: some View {
        
        NavigationView {
            ScrollView {
                ZStack {
                    Image("running")
                        .resizable()
                        .frame(height: 400)
                        .aspectRatio(contentMode: .fit)
                        .cornerRadius(20)
                        .zIndex(0)
                        
                    RoundedRectangle(cornerRadius: 20)
                        .fill(LinearGradient(gradient: Gradient(colors: [.blue, .green]), startPoint: .topLeading, endPoint: .bottomTrailing))
                        .frame(height: 400)
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
                            .position(x: 120, y: 220)
                            .frame(width: 200, height: 200, alignment: .center)
                        
                        Text("GoRun")
                            .animation(.easeInOut(duration: 1))
                    
                            .font(.system(size: 30, weight: .heavy, design: .default))
                            .foregroundColor(.white)
                            .position(x: 260, y: 140)
                        
                        Text("Optimal Weather")
                            .animation(.easeInOut(duration: 1))
                            .font(.system(size: 20, weight: .heavy, design: .default))
                            .position(x: 280, y: 70)
                            .foregroundColor(.gray)
                        
                    }
                    .zIndex(2)
                }
                .padding()
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
    
    func setupNav() {
        UINavigationBar.appearance().largeTitleTextAttributes = [.foregroundColor: UIColor.gray]

    }
}

struct DayView_Previews: PreviewProvider {
    static var previews: some View {
        DayView(viewModel: DayViewModel())
    }
}
