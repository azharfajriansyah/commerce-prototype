//
//  CommAPIResponse.swift
//  commerce prototype
//
//  Created by Azhar Fajriansyah on 28/06/20.
//  Copyright © 2020 Azhar Fajriansyah. All rights reserved.
//

import Foundation

struct CommAPIResponse<T: Decodable>: Decodable {
	
	var data: T
	
}
