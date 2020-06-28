//
//  TabBarItem.swift
//  commerce prototype
//
//  Created by Azhar Fajriansyah on 27/06/20.
//  Copyright © 2020 Azhar Fajriansyah. All rights reserved.
//

import Foundation
import UIKit

class TabBarItem {
	
	let title: String
	let viewController: UIViewController
	
	init(title: String, viewController: UIViewController) {
		self.title = title
		self.viewController = viewController
	}
	
}
