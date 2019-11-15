//
//  WeatherStore.swift
//  ReduxWeather
//
//  Created by Мисников Роман on 15/11/2019.
//  Copyright © 2019 Мисников Роман. All rights reserved.
//

typealias WeatherReducer = (WeatherAction, WeatherState)->(WeatherState)

enum WeatherAction {
	case update
}

struct WeatherState {
	var temperature: Double
}

protocol StoreSubscriber: AnyObject {
	func newState(_ state: WeatherState)
}

class WeatherStore {
	private var state: WeatherState
	private var reducer: WeatherReducer
	private var subscribers: [StoreSubscriber] = []

	init(state: WeatherState, reducer: @escaping WeatherReducer) {
		self.state = state
		self.reducer = reducer
	}

	func subcribe(_ subscriber: StoreSubscriber) {
		self.subscribers.append(subscriber)
	}

	func removeSubscriber(_ subscriber: StoreSubscriber) {
		guard let index = self.subscribers.firstIndex(where: { $0 === subscriber }) else { return }
		self.subscribers.remove(at: index)
	}

	func dispatch(_ action: WeatherAction) {
		self.state = reducer(action, state)
		self.subscribers.forEach { $0.newState(self.state) }
	}
}
