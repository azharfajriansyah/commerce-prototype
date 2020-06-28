//
//  HomeViewController.swift
//  commerce prototype
//
//  Created by Azhar Fajriansyah on 27/06/20.
//  Copyright © 2020 Azhar Fajriansyah. All rights reserved.
//

import Foundation
import UIKit
import IGListKit

class HomeViewController: BaseListViewController<HomeViewModel> {
	
	lazy var searchBar: UISearchBar = {
		let searchBar = UISearchBar()
		searchBar.placeholder = "Search product"
		searchBar.delegate = self
		return searchBar
	}()
	
	override func viewDidLoad() {
		super.viewDidLoad()
		
		viewModel?.fetchData()
	}
	
	override func setupViews() {
		super.setupViews()
		navigationItem.titleView = searchBar
	}
	
	override func setupObservers() {
		super.setupObservers()
		
		viewModel?.listData.asObservable().subscribe(onNext: { [weak self] (viewModels) in
			if let viewModels = viewModels {
				self?.data.accept(viewModels)
			}
		}).disposed(by: disposeBag)
	}
	
	override func listSectionController(forObject object: Any) -> ListSectionController {
		if object is ProductCellViewModel {
			return ProductPromoSectionController()
		} else if object is CategoryListCellViewModel {
			return CategoryListSectionController()
		}
		return ListSectionController()
	}
	
}

extension HomeViewController: UISearchBarDelegate {
	
	func searchBarShouldBeginEditing(_ searchBar: UISearchBar) -> Bool {
		navigationController?.pushViewController(SearchProductFactory.instantiate(), animated: true)
		return false
	}
	
}

extension HomeViewController: CategoryListSelectable {
	
	func didSelectCategory(_ category: Category) {
		print("Did select category with name: \(category.name ?? "")")
	}
	
}

extension HomeViewController: ProductListSelectable {
	
	func didSelectProduct(_ product: Product) {
		navigationController?.pushViewController(ProductDetailFactory.instantiate(withProduct: product), animated: true)
	}
	
}
