//
//  TabBarController.swift
//  commerce prototype
//
//  Created by Azhar Fajriansyah on 27/06/20.
//  Copyright © 2020 Azhar Fajriansyah. All rights reserved.
//

import Foundation
import UIKit
import RxSwift
import RxCocoa

class TabBarController: UITabBarController {
	
	var viewModel = TabBarViewModel()
	var disposeBag = DisposeBag()
	
	override func viewDidLoad() {
		super.viewDidLoad()
		delegate = self
		setupObservers()
	}
	
	func setupObservers() {
		viewModel.items.asObservable().subscribe(onNext: { [weak self] (items) in
			self?.setupTabBar(withItems: items)
		}).disposed(by: disposeBag)
	}
	
	func setupTabBar(withItems items: [TabBarItem]) {
		setViewControllers(items.compactMap({ $0.viewController }), animated: true)
		
		items.enumerated().forEach {
			tabBar.items![$0.offset].title = $0.element.title
			tabBar.items![$0.offset].titlePositionAdjustment = UIOffset(horizontal: 0, vertical: -15)
		}
	}
	
}

extension TabBarController: UITabBarControllerDelegate {
	
	func tabBarController(_ tabBarController: UITabBarController, shouldSelect viewController: UIViewController) -> Bool {
		if viewController is BaseNavigationController {
			return true
		}
		(tabBarController.selectedViewController as? BaseNavigationController)?.pushViewController(PurchasedListFactory.instantiate(), animated: true)
		
		return false
	}
	
}
