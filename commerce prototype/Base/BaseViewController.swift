//
//  BaseViewController.swift
//  commerce prototype
//
//  Created by Azhar Fajriansyah on 27/06/20.
//  Copyright © 2020 Azhar Fajriansyah. All rights reserved.
//

import Foundation
import UIKit
import RxSwift
import RxCocoa

class BaseViewController<T: BaseViewModel>: UIViewController {
	
	var disposeBag = DisposeBag()
	var viewModel: T?
	
	override func viewDidLoad() {
		super.viewDidLoad()
		setupViews()
		setupConstraints()
		setupObservers()
	}
	
	override func viewWillDisappear(_ animated: Bool) {
		super.viewWillDisappear(animated)
		removeBackButtonTitle()
	}
	
	func setupViews() {
		view.backgroundColor = .white
	}
	
	func setupConstraints() {
		
	}
	
	func setupObservers() {
		viewModel?.pageTitle.asObservable().subscribe(onNext: { [weak self] (title) in
			self?.title = title
		}).disposed(by: disposeBag)
	}
	
	func removeBackButtonTitle() {
		let backButton = UIBarButtonItem(title: "",
										 style: .plain,
										 target: nil,
										 action: nil)
		navigationItem.backBarButtonItem = backButton
	}
	
}
