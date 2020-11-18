//
//  SampleData.swift
//  CotswoldCast
//
//  Created by Carl Peto on 18/11/2020.
//

import Foundation

extension WeatherPeriod {
    static var sample3hWeather: WeatherPeriod = {
        let sample3hWeatherData = Data(sample3hWeatherJson.utf8)

        let decoder = JSONDecoder()
        decoder.dateDecodingStrategy = .secondsSince1970
        do {
            return try decoder.decode(WeatherPeriod.self, from: sample3hWeatherData)
        } catch let error {
            fatalError("failed to get sample data")
        }
    }()

    static var sampleFullWeather: [WeatherPeriod] = {
        let sampleFullWeatherData = Data(fullWeatherDataJson.utf8)

        do {
            return try weatherData(from: sampleFullWeatherData)
        } catch let error {
            fatalError("failed to get sample data")
        }
    }()
}

private let sample3hWeatherJson = """
{"dt":1604858400,"main":{"temp":13.53,"feels_like":12.9,"temp_min":12.63,"temp_max":13.53,"pressure":1017,"sea_level":1017,"grnd_level":1015,"humidity":85,"temp_kf":0.9},"weather":[{"id":500,"main":"Rain","description":"light rain","icon":"10n"}],"clouds":{"all":90},"wind":{"speed":1.39,"deg":177},"visibility":10000,"pop":0.24,"rain":{"3h":0.5},"sys":{"pod":"n"},"dt_txt":"2020-11-08 18:00:00"}
"""

private let fullWeatherDataJson = """
{
"cod":"200",
"message":0,
"cnt":40,
"list":[
{"dt":1604858400,"main":{"temp":13.53,"feels_like":12.9,"temp_min":12.63,"temp_max":13.53,"pressure":1017,"sea_level":1017,"grnd_level":1015,"humidity":85,"temp_kf":0.9},"weather":[{"id":500,"main":"Rain","description":"light rain","icon":"10n"}],"clouds":{"all":90},"wind":{"speed":1.39,"deg":177},"visibility":10000,"pop":0.24,"rain":{"3h":0.5},"sys":{"pod":"n"},"dt_txt":"2020-11-08 18:00:00"},
{"dt":1604869200,"main":{"temp":12.84,"feels_like":12.13,"temp_min":12.41,"temp_max":12.84,"pressure":1019,"sea_level":1019,"grnd_level":1016,"humidity":92,"temp_kf":0.43},"weather":[{"id":500,"main":"Rain","description":"light rain","icon":"10n"}],"clouds":{"all":98},"wind":{"speed":1.71,"deg":211},"visibility":10000,"pop":0.31,"rain":{"3h":0.21},"sys":{"pod":"n"},"dt_txt":"2020-11-08 21:00:00"},
{"dt":1604880000,"main":{"temp":11.5,"feels_like":10.76,"temp_min":11.3,"temp_max":11.5,"pressure":1019,"sea_level":1019,"grnd_level":1016,"humidity":95,"temp_kf":0.2},"weather":[{"id":803,"main":"Clouds","description":"broken clouds","icon":"04n"}],"clouds":{"all":83},"wind":{"speed":1.41,"deg":182},"visibility":10000,"pop":0.14,"sys":{"pod":"n"},"dt_txt":"2020-11-09 00:00:00"},
{"dt":1604890800,"main":{"temp":11.03,"feels_like":10,"temp_min":11,"temp_max":11.03,"pressure":1019,"sea_level":1019,"grnd_level":1016,"humidity":95,"temp_kf":0.03},"weather":[{"id":803,"main":"Clouds","description":"broken clouds","icon":"04n"}],"clouds":{"all":64},"wind":{"speed":1.64,"deg":138},"visibility":10000,"pop":0,"sys":{"pod":"n"},"dt_txt":"2020-11-09 03:00:00"},
{"dt":1604901600,"main":{"temp":10.91,"feels_like":9.59,"temp_min":10.91,"temp_max":10.91,"pressure":1019,"sea_level":1019,"grnd_level":1016,"humidity":96,"temp_kf":0},"weather":[{"id":803,"main":"Clouds","description":"broken clouds","icon":"04n"}],"clouds":{"all":78},"wind":{"speed":2.06,"deg":127},"visibility":10000,"pop":0,"sys":{"pod":"n"},"dt_txt":"2020-11-09 06:00:00"},
{"dt":1604912400,"main":{"temp":12.01,"feels_like":10.69,"temp_min":12.01,"temp_max":12.01,"pressure":1019,"sea_level":1019,"grnd_level":1016,"humidity":92,"temp_kf":0},"weather":[{"id":803,"main":"Clouds","description":"broken clouds","icon":"04d"}],"clouds":{"all":79},"wind":{"speed":2.25,"deg":122},"visibility":10000,"pop":0.04,"sys":{"pod":"d"},"dt_txt":"2020-11-09 09:00:00"},
{"dt":1604923200,"main":{"temp":15.29,"feels_like":13.73,"temp_min":15.29,"temp_max":15.29,"pressure":1019,"sea_level":1019,"grnd_level":1016,"humidity":76,"temp_kf":0},"weather":[{"id":804,"main":"Clouds","description":"overcast clouds","icon":"04d"}],"clouds":{"all":89},"wind":{"speed":2.73,"deg":139},"visibility":10000,"pop":0,"sys":{"pod":"d"},"dt_txt":"2020-11-09 12:00:00"},
{"dt":1604934000,"main":{"temp":15.32,"feels_like":13.68,"temp_min":15.32,"temp_max":15.32,"pressure":1019,"sea_level":1019,"grnd_level":1016,"humidity":74,"temp_kf":0},"weather":[{"id":804,"main":"Clouds","description":"overcast clouds","icon":"04d"}],"clouds":{"all":90},"wind":{"speed":2.69,"deg":154},"visibility":10000,"pop":0,"sys":{"pod":"d"},"dt_txt":"2020-11-09 15:00:00"},

{"dt":1604944800,"main":{"temp":13.3,"feels_like":11.74,"temp_min":13.3,"temp_max":13.3,"pressure":1019,"sea_level":1019,"grnd_level":1016,"humidity":86,"temp_kf":0},"weather":[{"id":804,"main":"Clouds","description":"overcast clouds","icon":"04n"}],"clouds":{"all":91},"wind":{"speed":2.69,"deg":141},"visibility":10000,"pop":0.12,"sys":{"pod":"n"},"dt_txt":"2020-11-09 18:00:00"},

{"dt":1604955600,"main":{"temp":13.18,"feels_like":11.9,"temp_min":13.18,"temp_max":13.18,"pressure":1020,"sea_level":1020,"grnd_level":1017,"humidity":89,"temp_kf":0},"weather":[{"id":500,"main":"Rain","description":"light rain","icon":"10n"}],"clouds":{"all":97},"wind":{"speed":2.46,"deg":140},"visibility":10000,"pop":0.9,"rain":{"3h":1.24},"sys":{"pod":"n"},"dt_txt":"2020-11-09 21:00:00"},
{"dt":1604966400,"main":{"temp":12.51,"feels_like":11.11,"temp_min":12.51,"temp_max":12.51,"pressure":1020,"sea_level":1020,"grnd_level":1017,"humidity":91,"temp_kf":0},"weather":[{"id":500,"main":"Rain","description":"light rain","icon":"10n"}],"clouds":{"all":98},"wind":{"speed":2.5,"deg":181},"visibility":10000,"pop":0.98,"rain":{"3h":0.29},"sys":{"pod":"n"},"dt_txt":"2020-11-10 00:00:00"},
{"dt":1604977200,"main":{"temp":11.66,"feels_like":10.33,"temp_min":11.66,"temp_max":11.66,"pressure":1021,"sea_level":1021,"grnd_level":1018,"humidity":96,"temp_kf":0},"weather":[{"id":802,"main":"Clouds","description":"scattered clouds","icon":"03n"}],"clouds":{"all":36},"wind":{"speed":2.38,"deg":176},"visibility":10000,"pop":0.09,"sys":{"pod":"n"},"dt_txt":"2020-11-10 03:00:00"},
{"dt":1604988000,"main":{"temp":11.24,"feels_like":10.1,"temp_min":11.24,"temp_max":11.24,"pressure":1021,"sea_level":1021,"grnd_level":1018,"humidity":97,"temp_kf":0},"weather":[{"id":802,"main":"Clouds","description":"scattered clouds","icon":"03n"}],"clouds":{"all":43},"wind":{"speed":2.01,"deg":172},"visibility":10000,"pop":0.03,"sys":{"pod":"n"},"dt_txt":"2020-11-10 06:00:00"},
{"dt":1604998800,"main":{"temp":12.32,"feels_like":10.95,"temp_min":12.32,"temp_max":12.32,"pressure":1022,"sea_level":1022,"grnd_level":1019,"humidity":92,"temp_kf":0},"weather":[{"id":804,"main":"Clouds","description":"overcast clouds","icon":"04d"}],"clouds":{"all":98},"wind":{"speed":2.44,"deg":180},"visibility":10000,"pop":0,"sys":{"pod":"d"},"dt_txt":"2020-11-10 09:00:00"},
{"dt":1605009600,"main":{"temp":14.83,"feels_like":12.76,"temp_min":14.83,"temp_max":14.83,"pressure":1023,"sea_level":1023,"grnd_level":1020,"humidity":77,"temp_kf":0},"weather":[{"id":804,"main":"Clouds","description":"overcast clouds","icon":"04d"}],"clouds":{"all":98},"wind":{"speed":3.35,"deg":187},"visibility":10000,"pop":0.2,"sys":{"pod":"d"},"dt_txt":"2020-11-10 12:00:00"},
{"dt":1605020400,"main":{"temp":14.87,"feels_like":12.56,"temp_min":14.87,"temp_max":14.87,"pressure":1023,"sea_level":1023,"grnd_level":1020,"humidity":72,"temp_kf":0},"weather":[{"id":500,"main":"Rain","description":"light rain","icon":"10d"}],"clouds":{"all":22},"wind":{"speed":3.32,"deg":183},"visibility":10000,"pop":0.78,"rain":{"3h":1.87},"sys":{"pod":"d"},"dt_txt":"2020-11-10 15:00:00"},
{"dt":1605031200,"main":{"temp":12.52,"feels_like":10.91,"temp_min":12.52,"temp_max":12.52,"pressure":1023,"sea_level":1023,"grnd_level":1020,"humidity":85,"temp_kf":0},"weather":[{"id":801,"main":"Clouds","description":"few clouds","icon":"02n"}],"clouds":{"all":15},"wind":{"speed":2.39,"deg":265},"visibility":10000,"pop":0.7,"sys":{"pod":"n"},"dt_txt":"2020-11-10 18:00:00"},
{"dt":1605042000,"main":{"temp":11.18,"feels_like":9.45,"temp_min":11.18,"temp_max":11.18,"pressure":1024,"sea_level":1024,"grnd_level":1021,"humidity":86,"temp_kf":0},"weather":[{"id":800,"main":"Clear","description":"clear sky","icon":"01n"}],"clouds":{"all":0},"wind":{"speed":2.14,"deg":247},"visibility":10000,"pop":0,"sys":{"pod":"n"},"dt_txt":"2020-11-10 21:00:00"},
{"dt":1605052800,"main":{"temp":10.29,"feels_like":8.88,"temp_min":10.29,"temp_max":10.29,"pressure":1023,"sea_level":1023,"grnd_level":1021,"humidity":85,"temp_kf":0},"weather":[{"id":800,"main":"Clear","description":"clear sky","icon":"01n"}],"clouds":{"all":8},"wind":{"speed":1.31,"deg":204},"visibility":10000,"pop":0,"sys":{"pod":"n"},"dt_txt":"2020-11-11 00:00:00"},
{"dt":1605063600,"main":{"temp":10.07,"feels_like":8.25,"temp_min":10.07,"temp_max":10.07,"pressure":1022,"sea_level":1022,"grnd_level":1020,"humidity":83,"temp_kf":0},"weather":[{"id":804,"main":"Clouds","description":"overcast clouds","icon":"04n"}],"clouds":{"all":100},"wind":{"speed":1.71,"deg":164},"visibility":10000,"pop":0,"sys":{"pod":"n"},"dt_txt":"2020-11-11 03:00:00"},
{"dt":1605074400,"main":{"temp":10.04,"feels_like":8.17,"temp_min":10.04,"temp_max":10.04,"pressure":1022,"sea_level":1022,"grnd_level":1019,"humidity":90,"temp_kf":0},"weather":[{"id":804,"main":"Clouds","description":"overcast clouds","icon":"04n"}],"clouds":{"all":100},"wind":{"speed":2.17,"deg":169},"visibility":10000,"pop":0,"sys":{"pod":"n"},"dt_txt":"2020-11-11 06:00:00"},
{"dt":1605085200,"main":{"temp":11.29,"feels_like":9.02,"temp_min":11.29,"temp_max":11.29,"pressure":1021,"sea_level":1021,"grnd_level":1018,"humidity":89,"temp_kf":0},"weather":[{"id":804,"main":"Clouds","description":"overcast clouds","icon":"04d"}],"clouds":{"all":100},"wind":{"speed":3.13,"deg":170},"visibility":10000,"pop":0,"sys":{"pod":"d"},"dt_txt":"2020-11-11 09:00:00"},
{"dt":1605096000,"main":{"temp":13.47,"feels_like":10.13,"temp_min":13.47,"temp_max":13.47,"pressure":1018,"sea_level":1018,"grnd_level":1015,"humidity":76,"temp_kf":0},"weather":[{"id":804,"main":"Clouds","description":"overcast clouds","icon":"04d"}],"clouds":{"all":100},"wind":{"speed":4.58,"deg":177},"visibility":10000,"pop":0,"sys":{"pod":"d"},"dt_txt":"2020-11-11 12:00:00"},
{"dt":1605106800,"main":{"temp":12.86,"feels_like":8.97,"temp_min":12.86,"temp_max":12.86,"pressure":1014,"sea_level":1014,"grnd_level":1012,"humidity":71,"temp_kf":0},"weather":[{"id":804,"main":"Clouds","description":"overcast clouds","icon":"04d"}],"clouds":{"all":100},"wind":{"speed":4.8,"deg":177},"visibility":10000,"pop":0,"sys":{"pod":"d"},"dt_txt":"2020-11-11 15:00:00"},
{"dt":1605117600,"main":{"temp":12.02,"feels_like":7.65,"temp_min":12.02,"temp_max":12.02,"pressure":1011,"sea_level":1011,"grnd_level":1009,"humidity":80,"temp_kf":0},"weather":[{"id":804,"main":"Clouds","description":"overcast clouds","icon":"04n"}],"clouds":{"all":100},"wind":{"speed":5.81,"deg":164},"visibility":10000,"pop":0,"sys":{"pod":"n"},"dt_txt":"2020-11-11 18:00:00"},
{"dt":1605128400,"main":{"temp":13.09,"feels_like":7.23,"temp_min":13.09,"temp_max":13.09,"pressure":1008,"sea_level":1008,"grnd_level":1005,"humidity":77,"temp_kf":0},"weather":[{"id":500,"main":"Rain","description":"light rain","icon":"10n"}],"clouds":{"all":100},"wind":{"speed":8.11,"deg":177},"visibility":10000,"pop":0.34,"rain":{"3h":0.16},"sys":{"pod":"n"},"dt_txt":"2020-11-11 21:00:00"},
{"dt":1605139200,"main":{"temp":11.94,"feels_like":5.62,"temp_min":11.94,"temp_max":11.94,"pressure":1007,"sea_level":1007,"grnd_level":1004,"humidity":64,"temp_kf":0},"weather":[{"id":501,"main":"Rain","description":"moderate rain","icon":"10n"}],"clouds":{"all":100},"wind":{"speed":7.52,"deg":224},"visibility":10000,"pop":1,"rain":{"3h":3.84},"sys":{"pod":"n"},"dt_txt":"2020-11-12 00:00:00"},
{"dt":1605150000,"main":{"temp":10.39,"feels_like":3.15,"temp_min":10.39,"temp_max":10.39,"pressure":1008,"sea_level":1008,"grnd_level":1005,"humidity":62,"temp_kf":0},"weather":[{"id":800,"main":"Clear","description":"clear sky","icon":"01n"}],"clouds":{"all":0},"wind":{"speed":8.31,"deg":239},"visibility":10000,"pop":0,"sys":{"pod":"n"},"dt_txt":"2020-11-12 03:00:00"},
{"dt":1605160800,"main":{"temp":9.34,"feels_like":2.1,"temp_min":9.34,"temp_max":9.34,"pressure":1010,"sea_level":1010,"grnd_level":1007,"humidity":60,"temp_kf":0},"weather":[{"id":800,"main":"Clear","description":"clear sky","icon":"01n"}],"clouds":{"all":1},"wind":{"speed":7.94,"deg":246},"visibility":10000,"pop":0,"sys":{"pod":"n"},"dt_txt":"2020-11-12 06:00:00"},
{"dt":1605171600,"main":{"temp":9.92,"feels_like":3.4,"temp_min":9.92,"temp_max":9.92,"pressure":1013,"sea_level":1013,"grnd_level":1010,"humidity":60,"temp_kf":0},"weather":[{"id":800,"main":"Clear","description":"clear sky","icon":"01d"}],"clouds":{"all":0},"wind":{"speed":7.05,"deg":244},"visibility":10000,"pop":0,"sys":{"pod":"d"},"dt_txt":"2020-11-12 09:00:00"},
{"dt":1605182400,"main":{"temp":11.37,"feels_like":5.43,"temp_min":11.37,"temp_max":11.37,"pressure":1014,"sea_level":1014,"grnd_level":1011,"humidity":54,"temp_kf":0},"weather":[{"id":802,"main":"Clouds","description":"scattered clouds","icon":"03d"}],"clouds":{"all":30},"wind":{"speed":6.19,"deg":233},"visibility":10000,"pop":0,"sys":{"pod":"d"},"dt_txt":"2020-11-12 12:00:00"},
{"dt":1605193200,"main":{"temp":11.75,"feels_like":6.71,"temp_min":11.75,"temp_max":11.75,"pressure":1013,"sea_level":1013,"grnd_level":1010,"humidity":58,"temp_kf":0},"weather":[{"id":804,"main":"Clouds","description":"overcast clouds","icon":"04d"}],"clouds":{"all":100},"wind":{"speed":5.25,"deg":222},"visibility":10000,"pop":0,"sys":{"pod":"d"},"dt_txt":"2020-11-12 15:00:00"},
{"dt":1605204000,"main":{"temp":11.32,"feels_like":6.63,"temp_min":11.32,"temp_max":11.32,"pressure":1013,"sea_level":1013,"grnd_level":1010,"humidity":70,"temp_kf":0},"weather":[{"id":804,"main":"Clouds","description":"overcast clouds","icon":"04n"}],"clouds":{"all":99},"wind":{"speed":5.4,"deg":210},"visibility":10000,"pop":0.12,"sys":{"pod":"n"},"dt_txt":"2020-11-12 18:00:00"},
{"dt":1605214800,"main":{"temp":11.23,"feels_like":6.25,"temp_min":11.23,"temp_max":11.23,"pressure":1013,"sea_level":1013,"grnd_level":1010,"humidity":70,"temp_kf":0},"weather":[{"id":803,"main":"Clouds","description":"broken clouds","icon":"04n"}],"clouds":{"all":81},"wind":{"speed":5.79,"deg":200},"visibility":10000,"pop":0,"sys":{"pod":"n"},"dt_txt":"2020-11-12 21:00:00"},
{"dt":1605225600,"main":{"temp":11.22,"feels_like":6.51,"temp_min":11.22,"temp_max":11.22,"pressure":1011,"sea_level":1011,"grnd_level":1008,"humidity":71,"temp_kf":0},"weather":[{"id":804,"main":"Clouds","description":"overcast clouds","icon":"04n"}],"clouds":{"all":86},"wind":{"speed":5.46,"deg":205},"visibility":10000,"pop":0,"sys":{"pod":"n"},"dt_txt":"2020-11-13 00:00:00"},
{"dt":1605236400,"main":{"temp":11.81,"feels_like":6.88,"temp_min":11.81,"temp_max":11.81,"pressure":1009,"sea_level":1009,"grnd_level":1006,"humidity":70,"temp_kf":0},"weather":[{"id":804,"main":"Clouds","description":"overcast clouds","icon":"04n"}],"clouds":{"all":98},"wind":{"speed":5.89,"deg":207},"visibility":10000,"pop":0.13,"sys":{"pod":"n"},"dt_txt":"2020-11-13 03:00:00"},
{"dt":1605247200,"main":{"temp":12,"feels_like":6.55,"temp_min":12,"temp_max":12,"pressure":1010,"sea_level":1010,"grnd_level":1007,"humidity":75,"temp_kf":0},"weather":[{"id":803,"main":"Clouds","description":"broken clouds","icon":"04n"}],"clouds":{"all":68},"wind":{"speed":7.02,"deg":216},"visibility":10000,"pop":0.02,"sys":{"pod":"n"},"dt_txt":"2020-11-13 06:00:00"},
{"dt":1605258000,"main":{"temp":12.93,"feels_like":8.18,"temp_min":12.93,"temp_max":12.93,"pressure":1011,"sea_level":1011,"grnd_level":1008,"humidity":78,"temp_kf":0},"weather":[{"id":500,"main":"Rain","description":"light rain","icon":"10d"}],"clouds":{"all":100},"wind":{"speed":6.55,"deg":212},"visibility":10000,"pop":0.35,"rain":{"3h":0.17},"sys":{"pod":"d"},"dt_txt":"2020-11-13 09:00:00"},
{"dt":1605268800,"main":{"temp":13.12,"feels_like":9.27,"temp_min":13.12,"temp_max":13.12,"pressure":1012,"sea_level":1012,"grnd_level":1009,"humidity":79,"temp_kf":0},"weather":[{"id":500,"main":"Rain","description":"light rain","icon":"10d"}],"clouds":{"all":100},"wind":{"speed":5.39,"deg":229},"visibility":10000,"pop":0.61,"rain":{"3h":0.99},"sys":{"pod":"d"},"dt_txt":"2020-11-13 12:00:00"},
{"dt":1605279600,"main":{"temp":13.37,"feels_like":9.55,"temp_min":13.37,"temp_max":13.37,"pressure":1012,"sea_level":1012,"grnd_level":1009,"humidity":73,"temp_kf":0},"weather":[{"id":500,"main":"Rain","description":"light rain","icon":"10d"}],"clouds":{"all":100},"wind":{"speed":5.02,"deg":226},"visibility":10000,"pop":0.6,"rain":{"3h":0.98},"sys":{"pod":"d"},"dt_txt":"2020-11-13 15:00:00"}
],
"city":{"id":2643743,"name":"London","coord":{"lat":51.5085,"lon":-0.1257},"country":"GB","population":1000000,"timezone":0,"sunrise":1604819219,"sunset":1604852498}}
"""


