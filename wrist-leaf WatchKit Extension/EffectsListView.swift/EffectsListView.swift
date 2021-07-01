//
//  EffectsListView.swift
//  wrist-leaf WatchKit Extension
//
//  Created by Connor Dean on 4/20/20.
//  Copyright © 2020 Connor Dean. All rights reserved.
//

import SwiftUI

//struct EffectsListView: View {
//    var body: some View {
//        Text(/*@START_MENU_TOKEN@*/"Hello, World!"/*@END_MENU_TOKEN@*/)
//    }
//}
//
//struct EffectsListView_Previews: PreviewProvider {
//    static var previews: some View {
//        EffectsListView()
//    }
// }

struct EffectsListView: View {
    let lightEffects: [String] = listEffects()
    var body: some View {
        VStack {
            ForEach(lightEffects, id: \.self) { effect in
                Text(effect)
            }
        }
    }
}

struct EffectsListView_Previews: PreviewProvider {
    static var previews: some View {
        EffectsListView()
    }
}
