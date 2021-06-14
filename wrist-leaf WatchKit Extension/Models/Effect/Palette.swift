//
//  Palette.swift
//  wrist-leaf WatchKit Extension
//
//  Created by Connor Dean on 6/13/21.
//  Copyright © 2021 Connor Dean. All rights reserved.
//

import Foundation

struct Palette: Hashable {
    let hue: Int
    let saturation: Int
    let brightness: Int
    
    init(hue: Int, saturation: Int, brightness: Int) {
        self.hue = hue
        self.saturation = saturation
        self.brightness = brightness
    }
}
