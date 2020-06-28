//
//  TabBarViewModel.swift
//  commerce prototype
//
//  Created by Azhar Fajriansyah on 27/06/20.
//  Copyright © 2020 Azhar Fajriansyah. All rights reserved.
//

import Foundation
import UIKit
import RxSwift
import RxCocoa

class TabBarViewModel: BaseViewModel {
	
	var items: BehaviorRelay<[TabBarItem]> = BehaviorRelay(value: [
		TabBarItem(title: "Home", viewController: BaseNavigationController(rootViewController: HomeFactory.instantiate(withTitle: "Home"))),
		TabBarItem(title: "Feed", viewController: BaseNavigationController(rootViewController: BaseViewController())),
		TabBarItem(title: "Cart", viewController: BaseNavigationController(rootViewController: BaseViewController())),
		TabBarItem(title: "Profile", viewController: UINavigationController(rootViewController: UIViewController()))
	])
	
	override init() {
		super.init()
		pageTitle.accept("")
	}
	
}
