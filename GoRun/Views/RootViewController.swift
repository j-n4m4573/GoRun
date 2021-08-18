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
    
    init() {
        setupViews()
    }
    
    var body: some View {
        NavigationView {
            GeometryReader { geometry in
                    VStack {
                        ZStack {
                            Rectangle()
                                .fill(Color.white)
                                .cornerRadius(20)
                                .shadow(radius: 4.0)
                                .zIndex(0)
                                .frame(width: geometry.size.width * 0.9, height: geometry.size.height * 0.5, alignment: .center)
                            Image("running")
                                .resizable()
                                .aspectRatio(contentMode: .fit)
                                .cornerRadius(10)
                                .clipped()
                                .zIndex(1)
                                .frame(width: geometry.size.width * 0.7, height: geometry.size.height * 0.48, alignment: .center)
                        }
                        
                        .background(Color.white)
                        .padding()
                        
                        // **** Week View ****
                      
                        WeekView(viewModel: rootViewModel)
                    }
                }
            }
    }
    
    func setupViews() {
        
    }
}

struct RootViewController_Previews: PreviewProvider {
    static var previews: some View {
        RootViewController()
    }
}


