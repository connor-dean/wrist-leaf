//
//  EffectsListView.swift
//  wrist-leaf WatchKit Extension
//
//  Created by Connor Dean on 4/20/20.
//  Copyright © 2020 Connor Dean. All rights reserved.
//

import SwiftUI

struct EffectsListView: View {
    let lightEffects: [LightEffect] = [LightEffect(title: "Test", palette: [
        Palette(hue: 123, saturation: 123, brightness: 123),
        Palette(hue: 5, saturation: 123, brightness: 123),
        Palette(hue: 60, saturation: 123, brightness: 123),
        Palette(hue: 75, saturation: 123, brightness: 123),
    ])]

    var body: some View {
        ScrollView {
            VStack {
                Text("Effects")
                    .font(.headline)
                    .fontWeight(.bold)
                    .multilineTextAlignment(.leading)
                    .lineLimit(nil)

                if (lightEffects.count == 0) {
                    Text("No effects found")
                } else {
                    ForEach(lightEffects, id: \.self) { lightEffect in
                        EffectItem(lightEffect: lightEffect)
                    }
                }
            }
        }
    }
}

struct EffectsListView_Previews: PreviewProvider {
    static var previews: some View {
        Group {
            EffectsListView()
        }
    }
}
