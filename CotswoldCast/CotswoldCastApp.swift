//
//  CotswoldCastApp.swift
//  CotswoldCast
//
//  Created by Carl Peto on 08/11/2020.
//

import SwiftUI

@main
struct CotswoldCastApp: App {
    @ObservedObject var loader = WeatherLoader()

    var body: some Scene {
        WindowGroup {
            if loader.loading {
                Text("loading...")
            } else if loader.showError {
                Text("error getting weather data")
            } else {
                ContentView(loader.weatherPeriods)
            }
        }
    }

    init() {
        loader.load()
    }
}
