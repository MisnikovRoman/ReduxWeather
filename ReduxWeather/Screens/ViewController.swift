//
//  ViewController.swift
//  ReduxWeather
//
//  Created by Мисников Роман on 14/11/2019.
//  Copyright © 2019 Мисников Роман. All rights reserved.
//

import UIKit

class ViewController: UIViewController {
	private let weatherService = WeatherService()

	override func viewDidLoad() {
		super.viewDidLoad()
		self.view.backgroundColor = #colorLiteral(red: 1.0, green: 1.0, blue: 1.0, alpha: 1.0)
		self.weatherService.currentWeather(forCity: "London") { result in
			switch result {
			case .success(let response): print(response)
			case .failure(let error): print(error)
			}
		}
	}
}

