//
//  WidgetView.swift
//  GoRun
//
//  Created by Jamar Gibbs on 8/4/21.
//

import SwiftUI

struct WidgetView: View {
    var body: some View {
        LazyVStack {
            DayView(viewModel: <#DayViewModel#>)
        }
    }
}

struct WidgetView_Previews: PreviewProvider {
    static var previews: some View {
        WidgetView()
    }
}
