//
//  CotswoldCastTests.swift
//  CotswoldCastTests
//
//  Created by Carl Peto on 08/11/2020.
//

import XCTest
@testable import CotswoldCast

class CotswoldCastTests: XCTestCase {

    override func setUpWithError() throws {
        // Put setup code here. This method is called before the invocation of each test method in the class.
    }

    override func tearDownWithError() throws {
        // Put teardown code here. This method is called after the invocation of each test method in the class.
    }

    func testSimpleParse() throws {
        // arrange
        let sample3hWeather = WeatherPeriod.sample3hWeather

        // assert

        XCTAssert(sample3hWeather.periodStart == Date(iso8601date: "2020-11-08T18:00:00+00:00"))

        assert {
            sample3hWeather.averageTemp == 13.53
            sample3hWeather.feelsLikeTemp == 12.9
            sample3hWeather.minTemp == 12.63
            sample3hWeather.maxTemp == 13.53
            sample3hWeather.humidity == 85
            sample3hWeather.cloudCover == 90
        }

        assert {
            sample3hWeather.weatherIcon == "10n"
            sample3hWeather.weatherDescription == "light rain"
        }

        assert {
            sample3hWeather.windSpeed == 1.39
            sample3hWeather.windDirection == 177
        }

        assert {
            sample3hWeather.rainProbability == 0.24
            sample3hWeather.rainAmount == 0.5
        }

        assert {
            sample3hWeather.isDaytime == false
        }
    }


    func testFullParse() throws {
        // arrange
        let sampleFullWeather = WeatherPeriod.sampleFullWeather

        let weather1 = sampleFullWeather[0]
        let weather2 = sampleFullWeather[8]

        // assert
        XCTAssert(weather1.periodStart == Date(iso8601date: "2020-11-08T18:00:00+00:00"))
        XCTAssert(weather2.periodStart == Date(iso8601date: "2020-11-09T18:00:00+00:00"))

        assert {
            weather1.averageTemp == 13.53
            weather1.feelsLikeTemp == 12.9
            weather1.minTemp == 12.63
            weather1.maxTemp == 13.53
            weather1.humidity == 85
            weather1.cloudCover == 90
        }

        assert {
            weather1.weatherIcon == "10n"
            weather1.weatherDescription == "light rain"
        }

        assert {
            weather1.windSpeed == 1.39
            weather1.windDirection == 177
        }

        assert {
            weather1.rainProbability == 0.24
            weather1.rainAmount == 0.5
        }

        assert {
            weather1.isDaytime == false
        }

        assert {
            weather2.averageTemp == 13.3
            weather2.feelsLikeTemp == 11.74
            weather2.minTemp == 13.3
            weather2.maxTemp == 13.3
            weather2.humidity == 86
            weather2.cloudCover == 91
        }

        assert {
            weather2.windSpeed == 2.69
            weather2.windDirection == 141
        }
    }
}

extension Date {
    static let iso8601DateFormatter: DateFormatter = {
        let dateFormatter = DateFormatter()
        dateFormatter.dateFormat = "yyyy-MM-dd'T'HH:mm:ssZZZZZ"
        return dateFormatter
    }()

    init?(iso8601date: String) {
        if let date = Date.iso8601DateFormatter.date(from: iso8601date) {
            self = date
        } else {
            return nil
        }
    }
}

