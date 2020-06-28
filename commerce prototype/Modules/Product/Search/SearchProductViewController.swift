//
//  SearchProductViewController.swift
//  commerce prototype
//
//  Created by Azhar Fajriansyah on 28/06/20.
//  Copyright © 2020 Azhar Fajriansyah. All rights reserved.
//

import Foundation
import IGListKit
import RxSwift
import RxCocoa

class SearchProductViewController: BaseListViewController<SearchProductViewModel> {
	
	lazy var searchBar: UISearchBar = {
		let searchBar = UISearchBar()
		searchBar.placeholder = "Search product"
		searchBar.delegate = self
		return searchBar
	}()
	
	override func viewDidLoad() {
		super.viewDidLoad()
	}
	
	override func viewDidLayoutSubviews() {
		super.viewDidLayoutSubviews()
		
		collectionView.contentInset = UIEdgeInsets(top: Dimens.large, left: 0, bottom: Dimens.large, right: 0)
	}
	
	override func setupViews() {
		super.setupViews()
		navigationItem.titleView = searchBar
		searchBar.becomeFirstResponder()
	}
	
	override func setupObservers() {
		super.setupObservers()
		
		searchBar.rx.text
			.observeOn(MainScheduler.asyncInstance)
			.distinctUntilChanged()
			.throttle(.milliseconds(500), scheduler: MainScheduler.instance)
			.subscribe(onNext: { [weak self] (text) in
				guard let text = text, !text.isEmpty else {
					self?.data.accept([])
					return
				}
				self?.viewModel?.search(phrase: text)
		}).disposed(by: disposeBag)
		
		viewModel?.listData.asObservable().subscribe(onNext: { [weak self] (viewModels) in
			self?.data.accept(viewModels)
		}).disposed(by: disposeBag)
	}
	
	override func listSectionController(forObject object: Any) -> ListSectionController {
		return ProductSectionController()
	}
	
}

extension SearchProductViewController: UISearchBarDelegate {
	
	func searchBarShouldBeginEditing(_ searchBar: UISearchBar) -> Bool {
		return true
	}
	
}

extension SearchProductViewController: ProductListSelectable {
	
	func didSelectProduct(_ product: Product) {
		navigationController?.pushViewController(ProductDetailFactory.instantiate(withProduct: product), animated: true)
	}
	
}
