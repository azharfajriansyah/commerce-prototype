//
//  PurchasedListFactory.swift
//  commerce prototype
//
//  Created by Azhar Fajriansyah on 28/06/20.
//  Copyright © 2020 Azhar Fajriansyah. All rights reserved.
//

import Foundation

class PurchasedListFactory {
	
	static func instantiate() -> PurchasedListViewController {
		let controller = PurchasedListViewController()
		let viewModel = PurchasedListViewModel()
		viewModel.pageTitle.accept("Purchase History")
		controller.viewModel = viewModel
		controller.hidesBottomBarWhenPushed = true
		return controller
	}
	
}
