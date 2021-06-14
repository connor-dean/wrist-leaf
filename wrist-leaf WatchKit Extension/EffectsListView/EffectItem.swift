//
//  EffectItem.swift
//  wrist-leaf WatchKit Extension
//
//  Created by Connor Dean on 6/13/21.
//  Copyright © 2021 Connor Dean. All rights reserved.
//

import SwiftUI

struct EffectItem: View {
    var lightEffect: LightEffect
    
    var body: some View {
        HStack(alignment: .center) {
            Circle()
                .fill(Color.red)
                .frame(width: 30.0, height: 30.0)
                .padding(5)

            Text(lightEffect.title)
                .font(.headline)
                .multilineTextAlignment(.leading)
                .lineLimit(1)
        }
        .padding(.vertical)
        .frame(maxWidth: .infinity, alignment: .leading)
    }
}

struct EffectItem_Previews: PreviewProvider {
    static var previews: some View {
        EffectItem(lightEffect: LightEffect(
            title: "Test",
            palette: [
                Palette(hue: 123, saturation: 100, brightness: 100)
            ]
        ))
    }
}
