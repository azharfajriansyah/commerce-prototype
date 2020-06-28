//
//  BaseListSectionController.swift
//  commerce prototype
//
//  Created by Azhar Fajriansyah on 28/06/20.
//  Copyright © 2020 Azhar Fajriansyah. All rights reserved.
//

import Foundation
import IGListKit

class BaseListSectionController<T: UICollectionViewCell & ListBindable & ListItemSizable, U: ListDiffable>: ListSectionController {
	
	var viewModel: U?
	
	override func cellForItem(at index: Int) -> UICollectionViewCell {
		guard let cell = collectionContext?.dequeueReusableCell(of: T.self, for: self, at: index) as? T else {
			fatalError()
		}
		if let viewModel = viewModel {
			cell.bindViewModel(viewModel)
		}
		return cell
	}
	
	override func sizeForItem(at index: Int) -> CGSize {
		guard let width = collectionContext?.containerSize.width else { return .zero }
		return CGSize(width: width, height: T.height())
	}
	
	override func didUpdate(to object: Any) {
		viewModel = object as? U
	}
	
}

protocol ListItemSizable {
	static func height() -> CGFloat
}
