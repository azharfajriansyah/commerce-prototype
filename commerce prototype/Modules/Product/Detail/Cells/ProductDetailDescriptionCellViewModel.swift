//
//  ProductDetailDescriptionCellViewModel.swift
//  commerce prototype
//
//  Created by Azhar Fajriansyah on 28/06/20.
//  Copyright © 2020 Azhar Fajriansyah. All rights reserved.
//

import Foundation
import IGListKit

class ProductDetailDescriptionCellViewModel {
	
	let description: String?
	
	init(description: String?) {
		self.description = description
	}
	
}

extension ProductDetailDescriptionCellViewModel: ListDiffable {
	
	func diffIdentifier() -> NSObjectProtocol {
		return (description ?? "") as NSObjectProtocol
	}
	
	func isEqual(toDiffableObject object: ListDiffable?) -> Bool {
		guard let object = object as? ProductDetailDescriptionCellViewModel else { return false }
		return description == object.description
	}
	
}
