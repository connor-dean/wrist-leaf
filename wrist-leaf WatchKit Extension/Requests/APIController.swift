//
//  APIController.swift
//  wrist-leaf WatchKit Extension
//
//  Created by Connor Dean on 4/18/20.
//  Copyright © 2020 Connor Dean. All rights reserved.
//

import Foundation

enum HTTPRequests: String {
    case GET = "GET"
    case POST = "POST"
    case PUT = "PUT"
    case DELETE = "DELETE"
}

// TODO see if we get this dynamically, Bonjour?
let ip = "192.168.1.22"
let port = "16021"
let token = "rrDukXFzoqmNP3Hwm6bbdVLLNftpKNui"
let url = URL(string: "http://\(ip):\(port)/api/v1/\(token)/")!

// TODO
func togglePower() -> [String] {
    return httpRequest(httpRequest: HTTPRequests.PUT, apiSuffix: "state")
}

func getLightInfo() -> [String] {
    return httpRequest(httpRequest: HTTPRequests.GET)
}

func listEffects() -> [String] {
    return httpRequest(httpRequest: HTTPRequests.GET, apiSuffix: "effects/effectsList")
}

func httpRequest(httpRequest: HTTPRequests, apiSuffix: String? = nil) -> [String] {
    let requestURL = URL(string: "\(url)\(apiSuffix ?? "")")
    var request = URLRequest(url: requestURL!)
    request.httpMethod = "\(httpRequest)"

    var responseData: [String] = []
    let task = URLSession.shared.dataTask(with: request) { (data, response, error) in
        if let error = error {
            print("There was an error making the request: \(error)")
            return
        }

        if let data = data, let lightInfo = String(data: data, encoding: .utf8) {
            print("Response data string:\n \(lightInfo)")
            let parsedBackslash = lightInfo.components(separatedBy: "\"")
            let parsedList = parsedBackslash.filter {$0 != "," && $0 != "[" && $0 != "]"}
            responseData = parsedList
        }
    }

    task.resume()
    return responseData // This is hitting a race condition
}
