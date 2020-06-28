//
//  PurchasedProductCellViewModel.swift
//  commerce prototype
//
//  Created by Azhar Fajriansyah on 28/06/20.
//  Copyright © 2020 Azhar Fajriansyah. All rights reserved.
//

import Foundation
import IGListKit

class PurchasedProductCellViewModel {
	
	let identifier: String
	let product: Product
	
	init(purchasedProduct: PurchasedProduct) {
		self.identifier = purchasedProduct.identifier
		self.product = purchasedProduct.product
	}
	
	func getProductName() -> String {
		return product.title ?? ""
	}
	
	func getProductPrice() -> String {
		return product.price ?? ""
	}
	
	func getProductImageURL() -> URL? {
		return URL(string: product.imageUrl ?? "")
	}
	
}

extension PurchasedProductCellViewModel: ListDiffable {
	
	func diffIdentifier() -> NSObjectProtocol {
		return identifier as NSObjectProtocol
	}
	
	func isEqual(toDiffableObject object: ListDiffable?) -> Bool {
		guard let object = object as? PurchasedProductCellViewModel else { return false }
		return identifier == object.identifier
	}
	
}

extension Collection where Element: PurchasedProduct {
	
	func convertToPurchasedProductCellViewModels() -> [PurchasedProductCellViewModel] {
		return self.compactMap({ PurchasedProductCellViewModel(purchasedProduct: $0) })
	}
	
}
