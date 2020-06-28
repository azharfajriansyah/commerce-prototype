//
//  ProductDetailNameCellViewModel.swift
//  commerce prototype
//
//  Created by Azhar Fajriansyah on 28/06/20.
//  Copyright © 2020 Azhar Fajriansyah. All rights reserved.
//

import Foundation
import IGListKit

class ProductDetailNameCellViewModel {
	
	let name: String?
	let liked: Bool
	
	init(name: String?, liked: Bool) {
		self.name = name
		self.liked = liked
	}
	
	func getName() -> String {
		return name ?? ""
	}
	
	func getLikeStatus() -> Bool {
		return liked
	}
	
}

extension ProductDetailNameCellViewModel: ListDiffable {
	
	func diffIdentifier() -> NSObjectProtocol {
		return (name ?? "") as NSObjectProtocol
	}
	
	func isEqual(toDiffableObject object: ListDiffable?) -> Bool {
		guard let object = object as? ProductDetailNameCellViewModel else { return false }
		return name == object.name &&
			liked == object.liked
	}
	
}
