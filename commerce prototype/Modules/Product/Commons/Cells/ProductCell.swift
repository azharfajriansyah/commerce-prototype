//
//  ProductCell.swift
//  commerce prototype
//
//  Created by Azhar Fajriansyah on 28/06/20.
//  Copyright © 2020 Azhar Fajriansyah. All rights reserved.
//

import Foundation
import IGListKit

class ProductCell: UICollectionViewCell {
	
	lazy var containerView: UIView = {
		let view = UIView()
		view.translatesAutoresizingMaskIntoConstraints = false
		view.backgroundColor = .white
		view.layer.cornerRadius = Dimens.default
		view.layer.borderColor = UIColor.systemGray5.cgColor
		view.layer.borderWidth = 1
		return view
	}()
	
	lazy var productImageView: UIImageView = {
		let imageView = UIImageView()
		imageView.translatesAutoresizingMaskIntoConstraints = false
		imageView.contentMode = .scaleAspectFit
		imageView.clipsToBounds = true
		return imageView
	}()
	
	lazy var productNameLabel: UILabel = {
		let label = UILabel()
		label.translatesAutoresizingMaskIntoConstraints = false
		label.font = UIFont.systemFont(ofSize: 14, weight: .medium)
		label.textColor = UIColor.darkText
		label.numberOfLines = 1
		return label
	}()
	
	lazy var productPriceLabel: UILabel = {
		let label = UILabel()
		label.translatesAutoresizingMaskIntoConstraints = false
		label.font = UIFont.systemFont(ofSize: 12, weight: .regular)
		label.textColor = UIColor.darkText
		label.numberOfLines = 1
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
		
		productImageView.sd_cancelCurrentImageLoad()
	}
	
	func setupViews() {
		containerView.addSubview(productImageView)
		containerView.addSubview(productNameLabel)
		containerView.addSubview(productPriceLabel)
		
		contentView.addSubview(containerView)
	}
	
	func setupConstraints() {
		productImageView.snp.makeConstraints { (make) in
			make.top.bottom.equalToSuperview()
			make.left.equalToSuperview().offset(Dimens.default)
			make.height.width.equalTo(ProductCell.height() - Dimens.large)
		}
		
		productNameLabel.snp.makeConstraints { (make) in
			make.left.equalTo(productImageView.snp.right).offset(Dimens.large)
			make.top.equalTo(productImageView.snp.top).offset(Dimens.default)
			make.right.equalToSuperview().offset(-Dimens.default)
		}
		
		productPriceLabel.snp.makeConstraints { (make) in
			make.left.equalTo(productNameLabel.snp.left)
			make.top.equalTo(productNameLabel.snp.bottom).offset(Dimens.default)
			make.right.equalToSuperview().offset(-Dimens.default)
		}
		
		containerView.snp.makeConstraints { (make) in
			make.left.equalToSuperview().offset(Dimens.large)
			make.center.equalToSuperview()
		}
	}
	
}

extension ProductCell: ListItemSizable {
	
	static func height() -> CGFloat {
		return 80
	}
	
}

extension ProductCell: ListBindable {
	
	func bindViewModel(_ viewModel: Any) {
		guard let viewModel = viewModel as? ProductCellViewModel else { return }
		
		productImageView.sd_setImage(with: viewModel.getProductImageURL(), completed: nil)
		productNameLabel.text = viewModel.getProductName()
		productPriceLabel.text = viewModel.getProductPrice()
	}
	
}
