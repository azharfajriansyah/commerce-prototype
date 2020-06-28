//
//  SearchProductFactory.swift
//  commerce prototype
//
//  Created by Azhar Fajriansyah on 28/06/20.
//  Copyright © 2020 Azhar Fajriansyah. All rights reserved.
//

import Foundation


class SearchProductFactory {
	
	static func instantiate() -> SearchProductViewController {
		let controller = SearchProductViewController()
		controller.viewModel = SearchProductViewModel()
		controller.hidesBottomBarWhenPushed = true
		return controller
	}
	
}
