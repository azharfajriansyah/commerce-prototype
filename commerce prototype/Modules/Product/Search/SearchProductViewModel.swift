//
//  SearchProductViewModel.swift
//  commerce prototype
//
//  Created by Azhar Fajriansyah on 28/06/20.
//  Copyright © 2020 Azhar Fajriansyah. All rights reserved.
//

import Foundation
import RxSwift
import RxCocoa

class SearchProductViewModel: BaseViewModel {
	
	private var products: [Product]?
	var listData: BehaviorRelay<[ProductCellViewModel]?> = BehaviorRelay(value: nil)
	
	override init() {
		super.init()
		products = fetchProducts()
	}
	
	private func fetchProducts() -> [Product]? {
		return FileHelper.unarchiveDecodable([Product].self, fileName: FileName.products)
	}
	
}

extension SearchProductViewModel {
	
	func search(phrase: String) {
		var result: [Product]?
		result = products?.filter({ ($0.title ?? "").lowercased().contains(phrase.lowercased()) })
		listData.accept(result?.convertToProductCellViewModels())
	}
	
}
