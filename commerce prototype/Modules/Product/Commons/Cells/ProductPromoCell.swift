//
//  ProductPromoCell.swift
//  commerce prototype
//
//  Created by Azhar Fajriansyah on 27/06/20.
//  Copyright © 2020 Azhar Fajriansyah. All rights reserved.
//

import UIKit
import IGListKit
import SDWebImage

class ProductPromoCell: UICollectionViewCell {
	
	static let productImageHeight: CGFloat = 120
	static let productNameFont: UIFont = UIFont.systemFont(ofSize: 14, weight: .medium)
	
	
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
	
	lazy var productLikeButton: UIButton = {
		let button = UIButton()
		button.translatesAutoresizingMaskIntoConstraints = false
		button.setImage(#imageLiteral(resourceName: "ic_like"), for: .normal)
		button.setImage(#imageLiteral(resourceName: "ic_like_red"), for: .selected)
		button.layer.masksToBounds = true
		button.layer.cornerRadius = 22
		button.layer.borderColor = UIColor.systemGray4.cgColor
		button.layer.borderWidth = 1
		return button
	}()
	
	lazy var productNameLabel: UILabel = {
		let label = UILabel()
		label.translatesAutoresizingMaskIntoConstraints = false
		label.font = ProductPromoCell.productNameFont
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
		containerView.addSubview(productLikeButton)
		containerView.addSubview(productNameLabel)
		
		contentView.addSubview(containerView)
	}
	
	func setupConstraints() {
		productImageView.snp.makeConstraints { (make) in
			make.left.top.right.equalToSuperview().offset(Dimens.default)
			make.height.equalTo(ProductPromoCell.productImageHeight - Dimens.default)
		}
		
		productLikeButton.snp.makeConstraints { (make) in
			make.left.bottom.equalTo(productImageView)
			make.height.width.equalTo(44)
		}
		
		productNameLabel.snp.makeConstraints { (make) in
			make.left.equalToSuperview().offset(Dimens.default)
			make.centerX.equalToSuperview()
			make.top.equalTo(productImageView.snp.bottom).offset(Dimens.large)
			make.bottom.equalToSuperview().offset(-Dimens.large)
		}
		
		containerView.snp.makeConstraints { (make) in
			make.top.equalToSuperview()
			make.left.equalToSuperview().offset(Dimens.large)
			make.centerX.equalToSuperview()
		}
	}
	
}

extension ProductPromoCell: ListItemSizable {
	
	static func height() -> CGFloat {
		return productImageHeight + productNameFont.lineHeight + (Dimens.large * 2) + Dimens.default
	}
	
}

extension ProductPromoCell: ListBindable {
	
	func bindViewModel(_ viewModel: Any) {
		guard let viewModel = viewModel as? ProductCellViewModel else { return }
		
		productImageView.sd_setImage(with: viewModel.getProductImageURL(), completed: nil)
		productLikeButton.isSelected = viewModel.getProductLoveStatus() == true
		productNameLabel.text = viewModel.getProductName()
	}
	
}
