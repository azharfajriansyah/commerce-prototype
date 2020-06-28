//
//  PurchasedProduct.swift
//  commerce prototype
//
//  Created by Azhar Fajriansyah on 28/06/20.
//  Copyright © 2020 Azhar Fajriansyah. All rights reserved.
//

import Foundation

class PurchasedProduct: Codable {
	
	let identifier = UUID().uuidString
	let product: Product
	
	init(product: Product) {
		self.product = product
	}
	
}
