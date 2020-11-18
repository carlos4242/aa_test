//
//  WeatherLoader.swift
//  CotswoldCast
//
//  Created by Carl Peto on 18/11/2020.
//

import Foundation

class WeatherLoader: ObservableObject {
    @Published var weatherPeriods: [WeatherPeriod] = []
    @Published var showError = false
    @Published var loading = true

    func load() {
        // hard coded query for demo
        let url = URL(string: "https://api.openweathermap.org/data/2.5/forecast?lat=51.9917903&lon=-1.6892947&appid=f1f9c7eb0dabfb194b1ce983a482532c&units=metric")!
        loading = true

        URLSession.shared.dataTask(
            with: URLRequest(url: url))
        { (data, response, error) in
            DispatchQueue.main.async {
                self.loading = false

                if
                    let data = data,
                    let periods = try? WeatherPeriod.weatherData(from: data)
                {
                    self.weatherPeriods = periods
                    self.showError = false
                } else {
                    self.showError = true
                }
            }
        }
        .resume()
    }
}
