//
//  HomeFactory.swift
//  commerce prototype
//
//  Created by Azhar Fajriansyah on 27/06/20.
//  Copyright © 2020 Azhar Fajriansyah. All rights reserved.
//

import Foundation

class HomeFactory {
	
	static func instantiate(withTitle title: String) -> HomeViewController {
		let controller = HomeViewController()
		let viewModel = HomeViewModel()
		viewModel.pageTitle.accept(title)
		controller.viewModel = viewModel
		return controller
	}
	
}
