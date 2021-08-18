//
//  LocationView.swift
//  GoRun
//
//  Created by Jamar Gibbs on 7/21/21.
//

import SwiftUI
import Combine

struct LocationView: View {
    
    @StateObject private var locationManager = LocationService()
    
    init() {}
    
    var body: some View {
        VStack {
            Group {
                Text("\(locationManager.location.coordinate.latitude)")
            }
        }
    }
}

struct LocationView_Previews: PreviewProvider {
    static var previews: some View {
        LocationView()
    }
}
