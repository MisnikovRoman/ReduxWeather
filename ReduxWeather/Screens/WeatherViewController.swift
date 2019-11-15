//
//  WeatherViewController.swift
//  ReduxWeather
//
//  Created by Мисников Роман on 14/11/2019.
//  Copyright © 2019 Мисников Роман. All rights reserved.
//

import UIKit

class WeatherViewController: UIViewController {
	private let weatherService = WeatherService()

	private let temperatureLabel: UILabel = {
		let lbl = UILabel()
		lbl.text = "12 Cº"
		lbl.font = UIFont.systemFont(ofSize: 30)
		lbl.translatesAutoresizingMaskIntoConstraints = false
		return lbl
	}()

	override func viewDidLoad() {
		super.viewDidLoad()

		self.setup()

		self.weatherService.currentWeather(forCity: "London") { result in
			switch result {
			case .success(let response): print(response)
			case .failure(let error): print(error)
			}
		}
	}
}

private extension WeatherViewController {
	func setup() {
		self.view.backgroundColor = #colorLiteral(red: 1.0, green: 1.0, blue: 1.0, alpha: 1.0)

		self.view.addSubview(self.temperatureLabel)

		NSLayoutConstraint.activate([
			self.temperatureLabel.centerXAnchor.constraint(equalTo: self.view.safeAreaLayoutGuide.centerXAnchor),
			self.temperatureLabel.centerYAnchor.constraint(equalTo: self.view.safeAreaLayoutGuide.centerYAnchor),
		])
	}
}
