//
//  CategoryCellViewModel.swift
//  commerce prototype
//
//  Created by Azhar Fajriansyah on 27/06/20.
//  Copyright © 2020 Azhar Fajriansyah. All rights reserved.
//

import Foundation
import IGListKit

class CategoryCellViewModel {
	
	let category: Category
	
	init(category: Category) {
		self.category = category
	}
	
	func getCategoryName() -> String {
		return category.name ?? ""
	}
	
	func getCategoryImageURL() -> URL? {
		return URL(string: category.imageUrl ?? "")
	}
	
}

extension CategoryCellViewModel: ListDiffable {
	
	func diffIdentifier() -> NSObjectProtocol {
		return (category.id ?? 0) as NSObjectProtocol
	}
	
	func isEqual(toDiffableObject object: ListDiffable?) -> Bool {
		guard let object = object as? CategoryCellViewModel else { return false }
		return category.id == object.category.id
	}
	
}

extension Collection where Element: Category {
	
	func convertToCategoryCellViewModels() -> [CategoryCellViewModel] {
		return self.compactMap({ CategoryCellViewModel(category: $0) })
	}
	
}
