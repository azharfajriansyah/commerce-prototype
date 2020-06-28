//
//  CategoryListCellViewModel.swift
//  commerce prototype
//
//  Created by Azhar Fajriansyah on 27/06/20.
//  Copyright © 2020 Azhar Fajriansyah. All rights reserved.
//

import Foundation
import IGListKit

class CategoryListCellViewModel {
	
	let categoryViewModels: [CategoryCellViewModel]
	
	init(categoryViewModels: [CategoryCellViewModel]) {
		self.categoryViewModels = categoryViewModels
	}
	
}

extension CategoryListCellViewModel: ListDiffable {
	
	func diffIdentifier() -> NSObjectProtocol {
		return categoryViewModels.compactMap({ $0.category.id }) as NSObjectProtocol
	}
	
	func isEqual(toDiffableObject object: ListDiffable?) -> Bool {
		guard let object = object as? CategoryListCellViewModel else { return false }
		return categoryViewModels.compactMap({ $0.category.id }) == object.categoryViewModels.compactMap({ $0.category.id })
	}
	
}
