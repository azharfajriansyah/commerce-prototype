//
//  PurchasedListViewModel.swift
//  commerce prototype
//
//  Created by Azhar Fajriansyah on 28/06/20.
//  Copyright © 2020 Azhar Fajriansyah. All rights reserved.
//

import Foundation
import RxSwift
import RxCocoa

class PurchasedListViewModel: BaseViewModel {
	
	var listData: BehaviorRelay<[PurchasedProductCellViewModel]?> = BehaviorRelay(value: nil)
	
	override init() {
		super.init()
		populatePurchasedProducts()
		
		NotificationCenter.default.addObserver(self,
											   selector: #selector(handleBuyNotification(_:)),
											   name: .buyProduct,
											   object: nil)
	}
	
	deinit {
		NotificationCenter.default.removeObserver(self)
	}
	
	private func fetchPurchasedProducts() -> [PurchasedProduct]? {
		return FileHelper.unarchiveDecodable([PurchasedProduct].self, fileName: FileName.purchasedProducts)
	}
	
	private func populatePurchasedProducts() {
		if let purchasedProducts = fetchPurchasedProducts() {
			listData.accept(purchasedProducts.convertToPurchasedProductCellViewModels())
		}
	}
	
	@objc func handleBuyNotification(_ notification: Notification) {
		populatePurchasedProducts()
	}
	
}
