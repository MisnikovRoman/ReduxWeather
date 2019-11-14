//
//  Weather.swift
//  ReduxWeather
//
//  Created by Мисников Роман on 14/11/2019.
//  Copyright © 2019 Мисников Роман. All rights reserved.
//

struct WeatherResponse: Codable {
    let coordinates: Coordinates
    let weather: [Weather]
    let base: String
    let main: Main
    let visibility: Int
    let wind: Wind
    let rain: Rain
	let clouds: Clouds
	/// Time of data calculation, unix, UTC
    let dataTime: Int
    let sys: Sys
	let timezone: Int
	let id: Int
    let name: String
    let cod: Int

	enum CodingKeys: String, CodingKey {
		case weather, base, main, visibility, wind, rain, clouds, sys, timezone, id, name, cod
		case coordinates = "coord"
		case dataTime = "dt"
	}
}

struct Clouds: Codable {
	/// Cloudiness, %
    let cloudiness: Int

	enum CodingKeys: String, CodingKey {
		case cloudiness = "all"
	}
}

struct Coordinates: Codable {
	/// City geolocation, longitude
	let longitude: Double
	/// City geolocation, latitude
	let latitude: Double

	enum CodingKeys: String, CodingKey {
		case longitude = "lon"
		case latitude = "lat"
	}
}

struct Main: Codable {
    let temperature, minTemperature, maxTemperature: Double
    let pressure, humidity: Int

    enum CodingKeys: String, CodingKey {
		case pressure, humidity
        case temperature = "temp"
        case minTemperature = "temp_min"
        case maxTemperature = "temp_max"
    }
}

struct Rain: Codable {
}

struct Sys: Codable {
    let type, id: Int
    let country: String
    let sunrise, sunset: Int
}

/// More info Weather condition codes
struct Weather: Codable {
	/// Weather condition id
	let id: Int
	/// Group of weather parameters (Rain, Snow, Extreme etc.)
	let main: String
	/// Weather condition within the group
	let weatherDescription: String
	/// Weather icon id
	let icon: String

    enum CodingKeys: String, CodingKey {
        case id, main, icon
        case weatherDescription = "description"
    }
}

struct Wind: Codable {
    let speed: Double
    let deg: Int
}
