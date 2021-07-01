//
//  Effect.swift
//  wrist-leaf WatchKit Extension
//
//  Created by Connor Dean on 6/13/21.
//  Copyright © 2021 Connor Dean. All rights reserved.
//

import Foundation

struct LightEffect: Hashable, Identifiable {
    let id: String
    let title: String
    let palette: [Palette]
    
    init(title: String, palette: [Palette]) {
        self.id = UUID().uuidString
        self.title = title
        self.palette = palette
    }
}
