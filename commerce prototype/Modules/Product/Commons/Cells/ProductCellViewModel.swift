//
//  ProductCellViewModel.swift
//  commerce prototype
//
//  Created by Azhar Fajriansyah on 28/06/20.
//  Copyright © 2020 Azhar Fajriansyah. All rights reserved.
//

import Foundation
import IGListKit

class ProductCellViewModel {
	
	let product: Product
	
	init(product: Product) {
		self.product = product
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
	
	func getProductLoveStatus() -> Bool {
		return product.getLovedStatus()
	}
	
}

extension ProductCellViewModel: ListDiffable {
	
	func diffIdentifier() -> NSObjectProtocol {
		return (product.id ?? "0") as NSObjectProtocol
	}
	
	func isEqual(toDiffableObject object: ListDiffable?) -> Bool {
		guard let object = object as? ProductCellViewModel else { return false }
		return product.id == object.product.id &&
			product.loved == object.product.loved
	}
	
}

extension Collection where Element: Product {
	
	func convertToProductCellViewModels() -> [ProductCellViewModel] {
		return self.compactMap({ ProductCellViewModel(product: $0) })
	}
	
}
