//
//  ProductDetailImageCellViewModel.swift
//  commerce prototype
//
//  Created by Azhar Fajriansyah on 28/06/20.
//  Copyright © 2020 Azhar Fajriansyah. All rights reserved.
//

import Foundation
import IGListKit

class ProductDetailImageCellViewModel {
	
	let imageUrl: String?
	
	init(imageUrl: String?) {
		self.imageUrl = imageUrl
	}
	
	func getImageURL() -> URL? {
		return URL(string: imageUrl ?? "")
	}
	
}

extension ProductDetailImageCellViewModel: ListDiffable {
	
	func diffIdentifier() -> NSObjectProtocol {
		return (imageUrl ?? "") as NSObjectProtocol
	}
	
	func isEqual(toDiffableObject object: ListDiffable?) -> Bool {
		guard let object = object as? ProductDetailImageCellViewModel else { return false }
		return imageUrl == object.imageUrl
	}
	
}
