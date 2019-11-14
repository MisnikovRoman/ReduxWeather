//
//  URLBuilder.swift
//  ReduxWeather
//
//  Created by Мисников Роман on 14/11/2019.
//  Copyright © 2019 Мисников Роман. All rights reserved.
//

import Foundation

class URLBuilder {
	func weather(forCity city: String) -> URL? {
		var components = URLComponents(string: Config.apiURL)
		components?.queryItems = [
			URLQueryItem(name: "q",     value: city),
			URLQueryItem(name: "APPID", value: Config.apiKey)
		]
		return components?.url
	}
}
