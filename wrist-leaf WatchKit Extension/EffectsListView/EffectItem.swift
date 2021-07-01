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
    let backgroundColor = UIColor(red: 200.0, green: 58.0, blue: 60.0, alpha: 1.0)
    
    func getCustomColors() -> [Color] {
        return lightEffect.palette.map { (palette) -> Color in
            print(Color(hue: Double(palette.hue), saturation: Double(palette.saturation), brightness: Double(palette.brightness))
            )
            return Color(hue: Double(palette.hue), saturation: Double(palette.saturation), brightness: Double(palette.brightness))
        }
    }
    
    var body: some View {
        HStack(alignment: .center) {
            Circle()
                .fill(AngularGradient(gradient: Gradient(colors: getCustomColors()), center: .center))
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
                Palette(hue: 50, saturation: 100, brightness: 100),
                Palette(hue: 75, saturation: 100, brightness: 100)
            ]
        ))
    }
}
