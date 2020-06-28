//
//  CommAPIRequest.swift
//  commerce prototype
//
//  Created by Azhar Fajriansyah on 28/06/20.
//  Copyright © 2020 Azhar Fajriansyah. All rights reserved.
//

import Foundation

enum CommAPIRequest {
	
	case home
	
}

extension CommAPIRequest {
	
	var path: String {
		switch self {
		case .home:
			return "https://private-4639ce-ecommerce56.apiary-mock.com/home"
		}
	}
	
}

extension CommAPIRequest {
	
	var url: URL? {
		return URL(string: path)
	}
	
	var urlRequest: URLRequest? {
		guard let url = url else { return nil }
		return URLRequest(url: url, timeoutInterval: 60)
	}
	
}
