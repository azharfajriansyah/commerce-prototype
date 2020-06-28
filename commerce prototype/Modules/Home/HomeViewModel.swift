//
//  HomeViewModel.swift
//  commerce prototype
//
//  Created by Azhar Fajriansyah on 27/06/20.
//  Copyright © 2020 Azhar Fajriansyah. All rights reserved.
//

import Foundation
import IGListKit
import RxCocoa
import RxSwift

class HomeViewModel: BaseViewModel {
	
	var listData: BehaviorRelay<[ListDiffable]?> = BehaviorRelay(value: nil)
	
	override init() {
		super.init()
		
		NotificationCenter.default.addObserver(self,
											   selector: #selector(handleLoveNotification(_:)),
											   name: .loveProduct,
											   object: nil)
	}
	
	deinit {
		NotificationCenter.default.removeObserver(self)
	}
	
	private func handleResponseData(_ data: Home) {
		var viewModels = [ListDiffable]()
		
		if let categoryList = data.category {
			viewModels.append(CategoryListCellViewModel(categoryViewModels: categoryList.convertToCategoryCellViewModels()))
		}
		
		if let products = data.productPromo {
			viewModels.append(contentsOf: products.convertToProductCellViewModels())
		}
		
		self.listData.accept(viewModels)
	}
	
	private func saveProducts(_ products: [Product]?) {
		guard let products = products else { return }
		try? FileHelper.archiveEncodable(products, fileName: FileName.products)
	}
	
}

// MARK: - Notification Handler -

extension HomeViewModel {
	
	@objc func handleLoveNotification(_ notification: Notification) {
		guard let object = notification.object as? NotificationObject.LoveProduct else { return }
		let viewModels = listData.value
		viewModels?.forEach {
			if let vm = $0 as? ProductCellViewModel, vm.product.id == object.id {
				vm.product.updateLoved(object.loved)
			}
		}
		listData.accept(viewModels)
	}
	
}

// MARK: - Public functions -

extension HomeViewModel {
	
	func fetchData() {
		CommAPI.shared.request(request: .home, expectedDataType: Home.self) { [weak self] (result) in
			switch result {
			case .success(let response):
				self?.handleResponseData(response.data)
			case .error(let error):
				debugPrint("Should show error to the user, the error: \(error.localizedDescription)")
			}
		}
	}
	
}
