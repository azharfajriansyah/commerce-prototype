//
//  TabBarFactory.swift
//  commerce prototype
//
//  Created by Azhar Fajriansyah on 27/06/20.
//  Copyright © 2020 Azhar Fajriansyah. All rights reserved.
//

import Foundation

class TabBarFactory {
	
	static func instantiate() -> TabBarController {
		let controller = TabBarController()
		controller.viewModel = TabBarViewModel()
		return controller
	}
	
}
