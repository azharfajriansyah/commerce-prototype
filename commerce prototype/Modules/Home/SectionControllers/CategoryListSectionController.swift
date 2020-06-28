//
//  CategoryListSectionController.swift
//  commerce prototype
//
//  Created by Azhar Fajriansyah on 27/06/20.
//  Copyright © 2020 Azhar Fajriansyah. All rights reserved.
//

import Foundation
import IGListKit

class CategoryListSectionController: ListSectionController {
	
	var viewModel: CategoryListCellViewModel?
	
	lazy var listAdapter: ListAdapter = {
		let adapter = ListAdapter(updater: ListAdapterUpdater(), viewController: self.viewController)
		adapter.dataSource = self
		return adapter
	}()
	
	override func cellForItem(at index: Int) -> UICollectionViewCell {
		guard let cell = collectionContext?.dequeueReusableCell(of: CategoryListCell.self, for: self, at: index) as? CategoryListCell else {
			fatalError()
		}
		listAdapter.collectionView = cell.collectionView
		return cell
	}
	
	override func sizeForItem(at index: Int) -> CGSize {
		guard let width = collectionContext?.containerSize.width else { return .zero }
		return CGSize(width: width, height: CategoryListCell.height())
	}
	
	override func didUpdate(to object: Any) {
		viewModel = object as? CategoryListCellViewModel
	}
	
}

extension CategoryListSectionController: ListAdapterDataSource {
	
	func objects(for listAdapter: ListAdapter) -> [ListDiffable] {
		return viewModel?.categoryViewModels ?? []
	}
	
	func listAdapter(_ listAdapter: ListAdapter, sectionControllerFor object: Any) -> ListSectionController {
		return CategorySectionController()
	}
	
	func emptyView(for listAdapter: ListAdapter) -> UIView? {
		return nil
	}
	
}
