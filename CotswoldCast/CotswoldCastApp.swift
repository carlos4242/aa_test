//
//  CotswoldCastApp.swift
//  CotswoldCast
//
//  Created by Carl Peto on 08/11/2020.
//

import SwiftUI

@main
struct CotswoldCastApp: App {
    @State var weatherPeriods: [WeatherPeriod] = []
    var body: some Scene {
        WindowGroup {
            ContentView(weatherPeriods)
        }
    }
}
