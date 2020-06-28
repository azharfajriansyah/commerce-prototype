//
//  ProductDetailFactory.swift
//  commerce prototype
//
//  Created by Azhar Fajriansyah on 28/06/20.
//  Copyright © 2020 Azhar Fajriansyah. All rights reserved.
//

import Foundation

class ProductDetailFactory {
	
	static func instantiate(withProduct product: Product) -> ProductDetailViewController {
		let viewController = ProductDetailViewController()
		let viewModel = ProductDetailViewModel(product: product)
		viewController.viewModel = viewModel
		viewController.hidesBottomBarWhenPushed = true
		return viewController
	}
	
}
