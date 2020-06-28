//
//  ProductSectionController.swift
//  commerce prototype
//
//  Created by Azhar Fajriansyah on 28/06/20.
//  Copyright © 2020 Azhar Fajriansyah. All rights reserved.
//

import Foundation

class ProductSectionController: BaseListSectionController<ProductCell, ProductCellViewModel> {
	
	override func didSelectItem(at index: Int) {
		guard let product = viewModel?.product else { return }
		(viewController as? ProductListSelectable)?.didSelectProduct(product)
	}
	
}
