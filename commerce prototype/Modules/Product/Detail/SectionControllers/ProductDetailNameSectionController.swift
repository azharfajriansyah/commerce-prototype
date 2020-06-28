//
//  ProductDetailNameSectionController.swift
//  commerce prototype
//
//  Created by Azhar Fajriansyah on 28/06/20.
//  Copyright © 2020 Azhar Fajriansyah. All rights reserved.
//

import Foundation
import IGListKit

class ProductDetailNameSectionController: BaseListSectionController<ProductDetailNameCell, ProductDetailNameCellViewModel> {
	
	override func cellForItem(at index: Int) -> UICollectionViewCell {
		guard let cell = collectionContext?.dequeueReusableCell(of: ProductDetailNameCell.self, for: self, at: index) as? ProductDetailNameCell else {
			fatalError()
		}
		if let viewModel = viewModel {
			cell.bindViewModel(viewModel)
		}
		cell.delegate = self
		return cell
	}
	
	override func sizeForItem(at index: Int) -> CGSize {
		guard let viewModel = viewModel, let width = collectionContext?.insetContainerSize.width else { return .zero }
		return CGSize(width: width, height: ProductDetailNameCell.height(width: width, viewModel: viewModel))
	}
	
}

extension ProductDetailNameSectionController: ProductDetailNameCellDelegate {
	
	func didSelectLove(loved: Bool) {
		(viewController as? ProductDetailViewController)?.viewModel?.updateProductLovedStatus(to: loved)
	}
	
}
