//
//  PurchasedProductCell.swift
//  commerce prototype
//
//  Created by Azhar Fajriansyah on 28/06/20.
//  Copyright © 2020 Azhar Fajriansyah. All rights reserved.
//

import Foundation

class PurchasedProductCell: ProductCell {
	
	override func bindViewModel(_ viewModel: Any) {
		guard let viewModel = viewModel as? PurchasedProductCellViewModel else { return }
		productImageView.sd_setImage(with: viewModel.getProductImageURL(), completed: nil)
		productNameLabel.text = viewModel.getProductName()
		productPriceLabel.text = viewModel.getProductPrice()
	}
	
}
