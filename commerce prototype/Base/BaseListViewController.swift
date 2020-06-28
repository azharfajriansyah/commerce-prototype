//
//  BaseListViewController.swift
//  commerce prototype
//
//  Created by Azhar Fajriansyah on 27/06/20.
//  Copyright © 2020 Azhar Fajriansyah. All rights reserved.
//

import Foundation
import UIKit
import IGListKit
import RxSwift
import RxCocoa

class BaseListViewController<T: BaseViewModel>: BaseViewController<T>, ListAdapterDataSource {
	
	var data: BehaviorRelay<[ListDiffable]?> = BehaviorRelay(value: nil)
	
	lazy var adapter: ListAdapter = {
		return ListAdapter(updater: ListAdapterUpdater(), viewController: self)
	}()
	
	lazy var viewLayout: ListCollectionViewLayout = {
		let layout = ListCollectionViewLayout(stickyHeaders: false, topContentInset: 0, stretchToEdge: false)
		return layout
	}()
	
	lazy var collectionView: UICollectionView = {
		let view = UICollectionView(frame: .zero, collectionViewLayout: viewLayout)
		view.showsVerticalScrollIndicator = false
		view.alwaysBounceVertical = true
		view.backgroundColor = .white
		view.keyboardDismissMode = .onDrag
		return view
	}()
	
	override func viewDidLoad() {
		super.viewDidLoad()
	}
	
	override func viewDidLayoutSubviews() {
		super.viewDidLayoutSubviews()
		
		let layoutFrameGuide = view.layoutMarginsGuide.layoutFrame
		collectionView.frame = CGRect(x: 0, y: layoutFrameGuide.minY, width: view.bounds.width, height: layoutFrameGuide.height)
	}
	
	override func setupViews() {
		super.setupViews()
		
		view.addSubview(collectionView)
		
		adapter.collectionView = collectionView
		adapter.dataSource = self
	}
	
	override func setupConstraints() {
		collectionView.snp.makeConstraints { (make) in
			make.edges.equalToSuperview()
		}
	}
	
	override func setupObservers() {
		super.setupObservers()
		
		data.asObservable().subscribe(onNext: { [weak self] (_) in
			DispatchQueue.main.async {
				self?.adapter.performUpdates(animated: true, completion: nil)
			}
		}).disposed(by: disposeBag)
	}
	
	func listSectionController(forObject object: Any) -> ListSectionController {
		fatalError("Implementation pending")
	}
	
	func objects(for listAdapter: ListAdapter) -> [ListDiffable] {
		return data.value ?? []
	}
	
	func listAdapter(_ listAdapter: ListAdapter, sectionControllerFor object: Any) -> ListSectionController {
		return listSectionController(forObject: object)
	}
	
	func emptyView(for listAdapter: ListAdapter) -> UIView? {
		return nil
	}
}

