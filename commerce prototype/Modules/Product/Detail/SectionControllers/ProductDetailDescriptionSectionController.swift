//
//  ProductDetailDescriptionSectionController.swift
//  commerce prototype
//
//  Created by Azhar Fajriansyah on 28/06/20.
//  Copyright © 2020 Azhar Fajriansyah. All rights reserved.
//

import Foundation
import IGListKit

class ProductDetailDescriptionSectionController: BaseListSectionController<ProductDetailDescriptionCell, ProductDetailDescriptionCellViewModel> {
	
	override func sizeForItem(at index: Int) -> CGSize {
		guard let viewModel = viewModel, let width = collectionContext?.containerSize.width else {
			return .zero
		}
		return CGSize(width: width, height: ProductDetailDescriptionCell.height(width: width, viewModel: viewModel))
	}
	
}
