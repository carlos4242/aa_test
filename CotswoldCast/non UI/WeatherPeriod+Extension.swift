//
//  WeatherPeriod+Extension.swift
//  CotswoldCast
//
//  Created by Carl Peto on 18/11/2020.
//

import Foundation

enum Weekday: Int {
    case Sun = 1, Mon, Tues, Wed, Thu, Fri, Sat
}

struct WeatherPeriodStartDescription {
    let periodStart: Date
    private let dateComponents: DateComponents

    var weekday: String? {
        if let weekdayInt = dateComponents.weekday, let weekday = Weekday(rawValue: weekdayInt) {
            return String(describing: weekday)
        } else {
            return nil
        }
    }

    var day: String? {
        dateComponents.day?.description
    }

    var dayDescription: String? {
        guard let day = day else {
            return nil
        }

        if day.hasSuffix("1") {
            return "\(day)st"
        } else if day.hasSuffix("2") {
            return "\(day)nd"
        } else if day.hasSuffix("3") {
            return "\(day)rd"
        } else {
            return "\(day)th"
        }
    }

    var month: String? {
        guard let month = dateComponents.month else {
            return nil
        }

        return Calendar.current.monthSymbols[month]
    }

    var hour: String? {
        dateComponents.hour?.description
    }

    init(_ periodStart: Date) {
        self.periodStart = periodStart
        let calendar = Calendar.current
        self.dateComponents = calendar.dateComponents([.day, .month, .weekday, .hour], from: periodStart)
    }
}

extension WeatherPeriod {
    var weatherPeriodStartDescription: WeatherPeriodStartDescription {
        WeatherPeriodStartDescription(periodStart)
    }

    var periodStartDescription: String {
        guard
            let weekday = weatherPeriodStartDescription.weekday,
            let dayDescription = weatherPeriodStartDescription.dayDescription,
            let month = weatherPeriodStartDescription.month,
            let hour = weatherPeriodStartDescription.hour else {
            return "---"
        }

        return "\(weekday), \(dayDescription) \(month) at \(hour):00"
    }
}
