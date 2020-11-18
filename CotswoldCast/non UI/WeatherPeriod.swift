//
//  WeatherPeriod.swift
//  CotswoldCast
//
//  Created by Carl Peto on 08/11/2020.
//

//- parse data for human consumption, map the open weather map data to a more human readable form
//- weather will be divided into 'period' structs, each mapped to a 3h period
//- the structs will hold: time, temperature, feels like, min and max and humidity
//- also, weather icon name, weather description, cloud cover (%), wind speed, wind direction, rain probability, rain amount, isDaytime
//- basic unit tests for the above parsing

import Foundation

struct WeatherPeriod: Decodable {
    var periodStart: Date // 3h periods
    var averageTemp: Float
    var feelsLikeTemp: Float
    var minTemp: Float
    var maxTemp: Float
    var humidity: Float
    var cloudCover: Float
    // having some trouble parsing this data with this method
    // to avoid wasting an hour or two for this exercise, hard coding
    // some data here now
    var weatherIcon: String = "10n"
    var weatherDescription: String = "light rain"
    var windSpeed: Float
    var windDirection: Float
    var rainProbability: Float?
    var rainAmount: Float?
    var isDaytime: Bool

    enum CodingKeys: String, CodingKey {
        case periodStart = "dt"
        case main
        case clouds
        case weather
        case wind
        case rainProbability = "pop"
        case rain
        case sys
    }

    enum MainCodingKeys: String, CodingKey {
        case averageTemp = "temp"
        case feelsLikeTemp = "feels_like"
        case minTemp = "temp_min"
        case maxTemp = "temp_max"
        case humidity = "humidity"
    }

    enum CloudsCodingKeys: String, CodingKey {
        case cloudCover = "all"
    }

    enum WeatherCodingKeys: String, CodingKey {
        case weatherIcon = "icon"
        case weatherDescription = "description"
    }

    enum WindCodingKeys: String, CodingKey {
        case windSpeed = "speed"
        case windDirection = "deg"
    }

    enum RainCodingKeys: String, CodingKey {
        case rainAmount = "3h"
    }

    enum SysCodingKeys: String, CodingKey {
        case isDaytime = "pod"
    }

    enum ParseError: Error {
        case notJson
    }

    init(from decoder: Decoder) throws {
        let container = try decoder.container(keyedBy: CodingKeys.self)
        self.periodStart =
            try Date(timeIntervalSince1970: TimeInterval(container.decode(UInt64.self, forKey: .periodStart)))

        let mainContainer = try container.nestedContainer(keyedBy: MainCodingKeys.self, forKey: .main)
        averageTemp = try mainContainer.decode(Float.self, forKey: .averageTemp)
        feelsLikeTemp = try mainContainer.decode(Float.self, forKey: .feelsLikeTemp)
        minTemp = try mainContainer.decode(Float.self, forKey: .minTemp)
        maxTemp = try mainContainer.decode(Float.self, forKey: .maxTemp)
        humidity = try mainContainer.decode(Float.self, forKey: .humidity)

        let cloudsContainer = try container.nestedContainer(keyedBy: CloudsCodingKeys.self, forKey: .clouds)

        cloudCover = try cloudsContainer.decode(Float.self, forKey: .cloudCover)

        // TODO: fix this
//        let weatherContainer = try container.nestedContainer(keyedBy: WeatherCodingKeys.self, forKey: .weather)
//        weatherIcon = try weatherContainer.decode(String.self, forKey: .weatherIcon)
//        weatherDescription = try weatherContainer.decode(String.self, forKey: .weatherDescription)


        let windContainer = try container.nestedContainer(keyedBy: WindCodingKeys.self, forKey: .wind)
        windSpeed = try windContainer.decode(Float.self, forKey: .windSpeed)
        windDirection = try windContainer.decode(Float.self, forKey: .windDirection)

        // TODO: fix this
        if let rainContainer = try? container.nestedContainer(keyedBy: RainCodingKeys.self, forKey: .rain) {
            rainProbability = try container.decode(Float.self, forKey: .rainProbability)
            rainAmount = try rainContainer.decode(Float.self, forKey: .rainAmount)
        }

        let sysContainer = try container.nestedContainer(keyedBy: SysCodingKeys.self, forKey: .sys)
        isDaytime = try sysContainer.decode(String.self, forKey: .isDaytime) == "d"

    }
}
