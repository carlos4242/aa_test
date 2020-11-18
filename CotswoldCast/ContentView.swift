//
//  ContentView.swift
//  CotswoldCast
//
//  Created by Carl Peto on 08/11/2020.
//

import SwiftUI

struct DayWeather: Identifiable {
    var id: Date {
        dayStart
    }

    init(_ periods: ArraySlice<WeatherPeriod>) {
        self.periods = Array(periods)
        self.dayStart = periods.first?.periodStart ?? Date()
        self.dayDescription = periods.first?.weatherPeriodStartDescription.weekday ?? ""
    }

    var dayStart: Date
    var dayDescription: String
    var periods: [WeatherPeriod]
}

struct ContentView: View {
    let weatherPeriods: [WeatherPeriod]
    let weatherPeriodByDay: [DayWeather]

    init(_ weatherPeriods: [WeatherPeriod]) {
        self.weatherPeriods = weatherPeriods
        self.weatherPeriodByDay = weatherPeriods.split { (period) -> Bool in
            period.weatherPeriodStartDescription.hour == "0"
        }
        .map(DayWeather.init)
    }

    var body: some View {
        ScrollView(.vertical, showsIndicators: false) {
            VStack(spacing: 20) {
                ForEach(weatherPeriodByDay) { dayWeather in
                    VStack {
                        Text("\(dayWeather.dayDescription)")
                        ScrollView(.horizontal, showsIndicators: false) {
                            HStack(spacing: 20) {
                                ForEach(dayWeather.periods) { period in
                                    WeatherPeriodView(weatherPeriod: period)
                                }
                            }
                        }
                    }
                    .padding()
                }
            }
        }
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView(WeatherPeriod.sampleFullWeather)
    }
}
