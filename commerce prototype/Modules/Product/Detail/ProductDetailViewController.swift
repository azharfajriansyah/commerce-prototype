//
//  ProductDetailViewController.swift
//  commerce prototype
//
//  Created by Azhar Fajriansyah on 28/06/20.
//  Copyright © 2020 Azhar Fajriansyah. All rights reserved.
//

import Foundation
import IGListKit
import RxSwift
import RxCocoa

class ProductDetailViewController: BaseListViewController<ProductDetailViewModel> {
	
	lazy var purchaseView: ProductDetailPurchaseView = {
		let view = ProductDetailPurchaseView()
		view.translatesAutoresizingMaskIntoConstraints = false
		return view
	}()
	
	override func viewDidLoad() {
		super.viewDidLoad()
	}
	
	override func viewDidLayoutSubviews() {
		super.viewDidLayoutSubviews()
		
		collectionView.contentInset = UIEdgeInsets(top: Dimens.large, left: 0, bottom: Dimens.large + purchaseView.bounds.height, right: 0)
	}
	
	override func setupViews() {
		super.setupViews()
		view.addSubview(purchaseView)
		
		let shareButton = UIBarButtonItem(barButtonSystemItem: .action, target: self, action: #selector(didTapShare(_:)))
		navigationItem.rightBarButtonItem = shareButton
	}
	
	override func setupConstraints() {
		super.setupConstraints()
		purchaseView.snp.makeConstraints { (make) in
			make.left.right.equalToSuperview()
			make.bottom.equalTo(view.snp.bottomMargin)
			make.height.equalTo(60)
		}
	}
	
	override func setupObservers() {
		super.setupObservers()
		
		viewModel?.listData.asObservable().subscribe(onNext: { [weak self] (viewModels) in
			self?.data.accept(viewModels)
		}).disposed(by: disposeBag)
		
		viewModel?.productPrice.asObservable().subscribe(onNext: { [weak self] (price) in
			self?.purchaseView.configure(price: price, didSelectBuyAction: {
				self?.viewModel?.purchase()
			})
		}).disposed(by: disposeBag)
	}
	
	override func listSectionController(forObject object: Any) -> ListSectionController {
		if object is ProductDetailImageCellViewModel {
			return BaseListSectionController<ProductDetailImageCell, ProductDetailImageCellViewModel>()
		} else if object is ProductDetailNameCellViewModel {
			return ProductDetailNameSectionController()
		} else if object is ProductDetailDescriptionCellViewModel {
			return ProductDetailDescriptionSectionController()
		}
		return ListSectionController()
	}
	
}

extension ProductDetailViewController {
	
	@objc func didTapShare(_ sender: UIBarButtonItem) {
		let shareSheet = UIActivityViewController(activityItems: viewModel?.shareItems ?? [], applicationActivities: nil)
		self.present(shareSheet, animated: true, completion: nil)
	}
	
}
