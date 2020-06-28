//
//  AppDelegate.swift
//  commerce prototype
//
//  Created by Azhar Fajriansyah on 27/06/20.
//  Copyright © 2020 Azhar Fajriansyah. All rights reserved.
//

import UIKit
import Foundation
import SnapKit

@UIApplicationMain
class AppDelegate: UIResponder, UIApplicationDelegate {

	var window: UIWindow?


	func application(_ application: UIApplication, didFinishLaunchingWithOptions launchOptions: [UIApplication.LaunchOptionsKey: Any]?) -> Bool {
		// Override point for customization after application launch.
		
		setupStyles()
		
		window = UIWindow(frame: UIScreen.main.bounds)
		window?.rootViewController = TabBarFactory.instantiate()
		window?.makeKeyAndVisible()
		
		return true
	}

}

extension AppDelegate {
	
	func setupStyles() {
		UITabBarItem.appearance().setTitleTextAttributes([
			NSAttributedString.Key.foregroundColor : UIColor.black,
			NSAttributedString.Key.font : UIFont.systemFont(ofSize: 15)
		], for: .normal)
		
		UITabBarItem.appearance().setTitleTextAttributes([
			NSAttributedString.Key.foregroundColor : UIColor.blue,
			NSAttributedString.Key.font : UIFont.boldSystemFont(ofSize: 15)
		], for: .selected)
	}
	
}

