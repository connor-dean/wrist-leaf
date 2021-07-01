//
//  EffectFetcher.swift
//  wrist-leaf WatchKit Extension
//
//  Created by Connor Dean on 6/13/21.
//  Copyright © 2021 Connor Dean. All rights reserved.
//

import Foundation
import Alamofire
import SwiftyJSON

public class EffectFetcher: ObservableObject {
    @Published var lightEffects: [LightEffect] = []
    @Published var fetchError: Bool = false
    
    let ip = "192.168.1.22"
    let port = "16021"
    let token = "rrDukXFzoqmNP3Hwm6bbdVLLNftpKNui"
    lazy var url = URL(string: "http://\(ip):\(port)/api/v1/\(token)/")!
    
    func fetchLightEffects(apiSuffix: String? = nil) {
        AF.request("\(url)\(apiSuffix ?? "")")
            .responseJSON { response in
                switch response.result {
                    case .success(let value):
                        let json = JSON(value)

                        let responseData = json[""].array ?? []
                        var lightEffectsArray: [LightEffect] = []
                        for lightEffect in responseData {
                            let title = lightEffect["title"].string ?? "Unknown"
                            let paletteArray = lightEffect["palette"].array ?? []
                            
                            let palette = paletteArray.map { (palette) -> Palette in
                                let hue = palette["hue"].int ?? 0
                                let saturation = palette["saturation"].int ?? 0
                                let brightness = palette["brightness"].int ?? 100
                                return Palette(hue: hue, saturation: saturation, brightness: brightness)
                            }
                            
                            lightEffectsArray.append(LightEffect(title: title, palette: palette))
                        }

                        self.lightEffects = lightEffectsArray

                    case .failure(let error):
                        print(error)
                        self.fetchError = true
                }
            }
    }
}
