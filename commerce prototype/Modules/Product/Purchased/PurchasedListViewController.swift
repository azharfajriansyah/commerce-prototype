//
//  PurchasedListViewController.swift
//  commerce prototype
//
//  Created by Azhar Fajriansyah on 28/06/20.
//  Copyright © 2020 Azhar Fajriansyah. All rights reserved.
//

import Foundation
import IGListKit

class PurchasedListViewController: BaseListViewController<PurchasedListViewModel> {
	
	override func viewDidLoad() {
		super.viewDidLoad()
	}
	
	override func viewDidLayoutSubviews() {
		super.viewDidLayoutSubviews()
		
		collectionView.contentInset = UIEdgeInsets(top: Dimens.large, left: 0, bottom: Dimens.large, right: 0)
	}
	
	override func setupObservers() {
		super.setupObservers()
		
		viewModel?.listData.asObservable().subscribe(onNext: { [weak self] (viewModels) in
			self?.data.accept(viewModels)
		}).disposed(by: disposeBag)
	}
	
	override func listSectionController(forObject object: Any) -> ListSectionController {
		return PurchasedProductSectionController()
	}
	
}

extension PurchasedListViewController: ProductListSelectable {
	
	func didSelectProduct(_ product: Product) {
		navigationController?.pushViewController(ProductDetailFactory.instantiate(withProduct: product), animated: true)
	}
	
}
