//
//  Product.swift
//  commerce prototype
//
//  Created by Azhar Fajriansyah on 27/06/20.
//  Copyright © 2020 Azhar Fajriansyah. All rights reserved.
//

import Foundation

class Product: Codable {
	
	private(set) var id: String?
	private(set) var imageUrl: String?
	private(set) var title: String?
	private(set) var desc: String?
	private(set) var price: String?
	private(set) var loved: Int?
	
	
	private enum CodingKeys: String, CodingKey {
		case id, imageUrl, title, price, loved
		case desc = "description"
	}
	
}

extension Product {
	
	func getLovedStatus() -> Bool {
		let lovedProducts = FileHelper.unarchiveDecodable([Product].self, fileName: FileName.lovedProducts) ?? []
		if lovedProducts.filter({ $0.id == id }).isEmpty {
			return (loved ?? 0) == 1
		} else {
			return true
		}
	}
	
	func updateLoved(_ loved: Bool) {
		self.loved = loved ? 1 : 0
		
		updateLovedProductsFile(statusLoved: loved)
		updateProductsFile(statusLoved: loved)
	}
	
	private func updateLovedProductsFile(statusLoved loved: Bool) {
		var lovedProducts = FileHelper.unarchiveDecodable([Product].self, fileName: FileName.lovedProducts) ?? []
		if loved {
			if !lovedProducts.contains(where: { $0.id == id }) {
				lovedProducts.append(self)
			}
		} else {
			lovedProducts.removeAll(where: { $0.id == id })
		}
		try? FileHelper.archiveEncodable(lovedProducts, fileName: FileName.lovedProducts)
	}
	
	private func updateProductsFile(statusLoved loved: Bool) {
		let products = FileHelper.unarchiveDecodable([Product].self, fileName: FileName.products) ?? []
		products.forEach {
			if $0.id == id { $0.loved = loved ? 1 : 0 }
		}
		try? FileHelper.archiveEncodable(products, fileName: FileName.products)
	}
	
}
