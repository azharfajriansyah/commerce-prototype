//
//  CategoryCell.swift
//  commerce prototype
//
//  Created by Azhar Fajriansyah on 27/06/20.
//  Copyright © 2020 Azhar Fajriansyah. All rights reserved.
//

import Foundation
import IGListKit

class CategoryCell: UICollectionViewCell {
	
	lazy var categoryImageView: UIImageView = {
		let imageView = UIImageView()
		imageView.translatesAutoresizingMaskIntoConstraints = false
		imageView.contentMode = .scaleAspectFit
		imageView.clipsToBounds = true
		return imageView
	}()
	
	lazy var categorytNameLabel: UILabel = {
		let label = UILabel()
		label.translatesAutoresizingMaskIntoConstraints = false
		label.font = UIFont.systemFont(ofSize: 12)
		label.textColor = UIColor.lightGray
		label.numberOfLines = 1
		label.textAlignment = .center
		return label
	}()
	
	override init(frame: CGRect) {
		super.init(frame: frame)
		setupViews()
		setupConstraints()
	}
	
	required init?(coder: NSCoder) {
		fatalError("init(coder:) has not been implemented")
	}
	
	override func prepareForReuse() {
		super.prepareForReuse()
		categoryImageView.sd_cancelCurrentImageLoad()
	}
	
	func setupViews() {
		contentView.addSubview(categoryImageView)
		contentView.addSubview(categorytNameLabel)
	}
	
	func setupConstraints() {
		categorytNameLabel.snp.makeConstraints { (make) in
			make.left.equalToSuperview().offset(Dimens.small)
			make.centerX.equalToSuperview()
			make.bottom.equalToSuperview().offset(-Dimens.large)
			make.height.equalTo(25)
		}
		
		categoryImageView.snp.makeConstraints { (make) in
			make.left.equalToSuperview()
			make.top.equalToSuperview().offset(Dimens.large)
			make.centerX.equalToSuperview()
			make.bottom.equalTo(categorytNameLabel.snp.top)
		}
	}
	
}

extension CategoryCell: ListBindable {
	
	func bindViewModel(_ viewModel: Any) {
		guard let viewModel = viewModel as? CategoryCellViewModel else { return }
		
		categoryImageView.sd_setImage(with: viewModel.getCategoryImageURL(), completed: nil)
		categorytNameLabel.text = viewModel.getCategoryName()
	}
	
}
