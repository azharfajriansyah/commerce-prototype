//
//  CategorySectionController.swift
//  commerce prototype
//
//  Created by Azhar Fajriansyah on 27/06/20.
//  Copyright © 2020 Azhar Fajriansyah. All rights reserved.
//

import Foundation
import IGListKit

class CategorySectionController: ListSectionController {
	
	var viewModel: CategoryCellViewModel?
	
	override func cellForItem(at index: Int) -> UICollectionViewCell {
		guard let cell = collectionContext?.dequeueReusableCell(of: CategoryCell.self, for: self, at: index) as? CategoryCell else {
			fatalError()
		}
		if let viewModel = viewModel {
			cell.bindViewModel(viewModel)
		}
		return cell
	}
	
	override func sizeForItem(at index: Int) -> CGSize {
		guard let _ = collectionContext else { return .zero }
		return CGSize(width: CategoryListCell.height(), height: CategoryListCell.height())
	}
	
	override func didUpdate(to object: Any) {
		viewModel = object as? CategoryCellViewModel
	}
	
	override func didSelectItem(at index: Int) {
		guard let category = viewModel?.category else { return }
		(viewController as? CategoryListSelectable)?.didSelectCategory(category)
	}
	
}
