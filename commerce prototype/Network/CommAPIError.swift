//
//  CommAPIError.swift
//  commerce prototype
//
//  Created by Azhar Fajriansyah on 28/06/20.
//  Copyright © 2020 Azhar Fajriansyah. All rights reserved.
//

import Foundation

enum CommAPIError {
	case `default`
	case invalidData
	
	var description: String {
		switch self {
		case .default:
			return "Something went wrong"
		case .invalidData:
			return "Invalid data"
		}
	}
	
	func asNSError() -> NSError {
		return NSError(domain: "CommAPI", code: 0, userInfo: [NSLocalizedDescriptionKey : description])
	}
}
