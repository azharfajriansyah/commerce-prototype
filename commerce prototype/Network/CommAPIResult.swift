//
//  CommAPIResult.swift
//  commerce prototype
//
//  Created by Azhar Fajriansyah on 28/06/20.
//  Copyright © 2020 Azhar Fajriansyah. All rights reserved.
//

import Foundation

enum CommAPIResult<Value> {
	case success(Value)
	case error(NSError)
}
