//
//  ContentView.swift
//  wrist-leaf WatchKit Extension
//
//  Created by Connor Dean on 4/18/20.
//  Copyright © 2020 Connor Dean. All rights reserved.
//

import SwiftUI

struct ContentView: View {
    var body: some View {
        VStack {
            Button(action: {
//                getLightInfo()
            }) {
                Text("Light Info")
            }
            
            NavigationLink(
            destination: EffectsListView()) {
                Text("List Effects")
            }
        }
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
