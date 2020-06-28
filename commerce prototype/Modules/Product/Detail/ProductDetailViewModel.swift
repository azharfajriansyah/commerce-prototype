//
//  ProductDetailViewModel.swift
//  commerce prototype
//
//  Created by Azhar Fajriansyah on 28/06/20.
//  Copyright © 2020 Azhar Fajriansyah. All rights reserved.
//

import Foundation
import IGListKit
import RxSwift
import RxCocoa

class ProductDetailViewModel: BaseViewModel {
	
	private var product: BehaviorRelay<Product?> = BehaviorRelay(value: nil)
	var productPrice: BehaviorRelay<String?> = BehaviorRelay(value: nil)
	var listData: BehaviorRelay<[ListDiffable]?> = BehaviorRelay(value: nil)
	
	var shareItems: [Any] {
		get {
			guard let productName = product.value?.title, let price = productPrice.value else { return [""] }
			return ["\(productName), \(price)"]
		}
	}
	
	init(product: Product) {
		super.init()
		setupObservers()
		
		self.product.accept(product)
	}
	
	func setupObservers() {
		product.asObservable().subscribe(onNext: { [weak self] (product) in
			self?.productPrice.accept(product?.price)
			self?.listData.accept([
				ProductDetailImageCellViewModel(imageUrl: product?.imageUrl),
				ProductDetailNameCellViewModel(name: product?.title, liked: product?.getLovedStatus() ?? false),
				ProductDetailDescriptionCellViewModel(description: product?.desc)
			])
		}).disposed(by: disposeBag)
	}
	
	func updateProductLovedStatus(to loved: Bool) {
		product.value?.updateLoved(loved)
		NotificationCenter.default.post(name: Notification.Name.loveProduct, object: NotificationObject.LoveProduct(id: product.value?.id, loved: loved))
	}
	
	func purchase() {
		guard let product = self.product.value else { return }
		var purchasedProducts = FileHelper.unarchiveDecodable([PurchasedProduct].self, fileName: FileName.purchasedProducts) ?? []
		purchasedProducts.append(PurchasedProduct(product: product))
		
		try? FileHelper.archiveEncodable(purchasedProducts, fileName: FileName.purchasedProducts)
		print("Product successfully purchased")
		
		NotificationCenter.default.post(name: .buyProduct, object: nil)
	}
	
}
