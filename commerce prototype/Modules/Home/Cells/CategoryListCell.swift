//
//  CategoryListCell.swift
//  commerce prototype
//
//  Created by Azhar Fajriansyah on 27/06/20.
//  Copyright © 2020 Azhar Fajriansyah. All rights reserved.
//

import Foundation
import IGListKit

class CategoryListCell: UICollectionViewCell {
	
	lazy var viewLayout: UICollectionViewFlowLayout = {
		let layout = UICollectionViewFlowLayout()
		layout.scrollDirection = .horizontal
		return layout
	}()
	
	lazy var collectionView: UICollectionView = {
		let view = UICollectionView(frame: .zero, collectionViewLayout: viewLayout)
		view.showsHorizontalScrollIndicator = false
		view.alwaysBounceHorizontal = true
		view.backgroundColor = .white
		
		self.contentView.addSubview(view)
		
		return view
	}()
	
	override func layoutSubviews() {
		super.layoutSubviews()
		
		let bounds = self.contentView.bounds
		collectionView.frame = bounds
	}
	
}

extension CategoryListCell: ListItemSizable {
	
	static func height() -> CGFloat {
		return 100
	}
	
}
