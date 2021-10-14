//
//  PlaceholderView.swift
//  GoRun
//
//  Created by Jamar Gibbs on 9/27/21.
//

import SwiftUI

struct PlaceholderView: View {
    var body: some View {
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
            }
            
        }
    }
}

struct PlaceholderView_Previews: PreviewProvider {
    static var previews: some View {
        PlaceholderView()
    }
}
