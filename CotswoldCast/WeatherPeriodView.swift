//
//  WeatherPeriodView.swift
//  CotswoldCast
//
//  Created by Carl Peto on 18/11/2020.
//

import SwiftUI

extension WeatherPeriod {
    // how to adjust the colour saturation based on cloud cover
    // no cloud cover -> 100% saturation, 100% cloud cover, no colour...
    var cloudDesaturation: Double {
        Double((100.0 - self.cloudCover) / 100.0)
    }
}

struct WeatherPeriodView: View {
    var weatherPeriod: WeatherPeriod

    var body: some View {
        VStack {
            Text("\(weatherPeriod.periodStartDescription)")
                .foregroundColor(Color("WeatherTextColor")) //
                .bold()
                .font(.headline)
                .padding()
                .textCase(.uppercase)
                .frame(alignment: .top)
            Divider()
            ZStack(alignment: .bottomLeading) {
                HStack {
                    Spacer()
                    VStack {
                        Spacer()

                        Text("Temp: \(Int(weatherPeriod.averageTemp.rounded()))C")
                            .font(.headline)
                            .padding()
                        Text("(feels like \(Int(weatherPeriod.feelsLikeTemp.rounded()))C)")
                            .font(Font.system(size: 11))
                            .padding()
                        Text("Min: \(Int(weatherPeriod.minTemp.rounded()))C")
                        Text("Max: \(Int(weatherPeriod.maxTemp.rounded()))C")

                        Spacer()
                    }
                    Spacer()
                }

                Image(weatherPeriod.weatherIcon)
                    .resizable()
                    .frame(width: 100, height: 100, alignment: .center)
                    .padding()
            }
        }
        .frame(width: 280, height: 280, alignment: .center)
        .background(
            Color("WeatherPeriodBackgroundColor")
                .saturation(weatherPeriod.cloudDesaturation)
        )
        .cornerRadius(9)
    }
}

struct WeatherPeriodView_Previews: PreviewProvider {
    static var previews: some View {
        Group {
            WeatherPeriodView(weatherPeriod: WeatherPeriod.sample3hWeather)
            WeatherPeriodView(weatherPeriod: WeatherPeriod.sample3hWeather)
                .environment(\.colorScheme, .dark)
            WeatherPeriodView(weatherPeriod: WeatherPeriod.sample3hWeather)
                .previewDevice(PreviewDevice(rawValue: "iPhone 11 Pro Max"))
            WeatherPeriodView(weatherPeriod: WeatherPeriod.sample3hWeather)
                .previewDevice(PreviewDevice(rawValue: "iPhone 11 Pro Max"))
                .environment(\.colorScheme, .dark)
        }
    }
}

struct WeatherPeriodDate {

}
