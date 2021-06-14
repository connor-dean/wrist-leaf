//
//  EffectsListView.swift
//  wrist-leaf WatchKit Extension
//
//  Created by Connor Dean on 4/20/20.
//  Copyright © 2020 Connor Dean. All rights reserved.
//

import SwiftUI

struct EffectsListView: View {
//    let lightEffects: [String] = listEffects()
    let lightEffects: [LightEffect]
    
    var body: some View {
        VStack {
            Text("Effects")
                .font(.headline)
                .fontWeight(.bold)
                .multilineTextAlignment(.leading)
                .lineLimit(nil)
                .padding()
            
            if (lightEffects.count == 0) {
                Text("No effects found")
            } else {
                List(lightEffects) { lightEffect in
                    EffectItem(lightEffect: lightEffect)
                }
            }
        }
    }
}

struct EffectsListView_Previews: PreviewProvider {
    static var previews: some View {
        Group {
            EffectsListView(lightEffects: [
                LightEffect(title: "Test", palette: [
                    Palette(hue: 123, saturation: 123, brightness: 123),
                ]),
                LightEffect(title: "Test 2", palette: [
                    Palette(hue: 123, saturation: 123, brightness: 123),
                ])
            ])
        }
    }
}
