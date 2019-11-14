//
//  WeatherService.swift
//  ReduxWeather
//
//  Created by Мисников Роман on 14/11/2019.
//  Copyright © 2019 Мисников Роман. All rights reserved.
//

import Foundation

typealias WeatherResult = Result<WeatherResponse, WeatherServiceError>

enum WeatherServiceError: Error {
	case wrongUrl
	case loadingError(Error)
	case noData
	case statusCode
	case decodeError(Error)
}

protocol IWeatherService {
	func currentWeather(forCity city: String, completion: @escaping (WeatherResult)->Void)
}

class WeatherService {
	private let urlBuilder = URLBuilder()
}

extension WeatherService: IWeatherService {
	func currentWeather(forCity city: String, completion: @escaping (WeatherResult)->Void) {
		guard let url = self.urlBuilder.weather(forCity: city) else {
			completion(.failure(.wrongUrl))
			return
		}

		print("🚀", url.absoluteString)

		URLSession.shared.dataTask(with: url) { data, response, error in
			guard error == nil else {
				completion(.failure(.loadingError(error!)))
				return
			}
			guard let data = data else {
				completion(.failure(.noData))
				return
			}
			guard let httpResponse = response as? HTTPURLResponse,
				200...299 ~= httpResponse.statusCode else {
					completion(.failure(.statusCode))
					return
			}

			do {
				let weatherResponse = try JSONDecoder().decode(WeatherResponse.self, from: data)
				completion(.success(weatherResponse))
			} catch {
				completion(.failure(.decodeError(error)))
			}
		}.resume()
	}
}
