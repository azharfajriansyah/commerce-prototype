//
//  ProductDetailNameCell.swift
//  commerce prototype
//
//  Created by Azhar Fajriansyah on 28/06/20.
//  Copyright © 2020 Azhar Fajriansyah. All rights reserved.
//

import IGListKit

protocol ProductDetailNameCellDelegate: class {
	func didSelectLove(loved: Bool)
}

class ProductDetailNameCell: UICollectionViewCell {
	
	static let productNameFont = UIFont.systemFont(ofSize: 15, weight: .bold)
	
	weak var delegate: ProductDetailNameCellDelegate?
	
	lazy var productNameLabel: UILabel = {
		let label = UILabel()
		label.translatesAutoresizingMaskIntoConstraints = false
		label.font = ProductDetailNameCell.productNameFont
		label.textColor = UIColor.darkText
		label.numberOfLines = 0
		return label
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
		button.addTarget(self, action: #selector(didTapLove(_:)), for: .touchUpInside)
		return button
	}()
    
	override init(frame: CGRect) {
		super.init(frame: frame)
		setupViews()
		setupConstraints()
	}
	
	required init?(coder: NSCoder) {
		fatalError("init(coder:) has not been implemented")
	}
	
	func setupViews() {
		contentView.addSubview(productNameLabel)
		contentView.addSubview(productLikeButton)
	}
	
	func setupConstraints() {
		productLikeButton.snp.makeConstraints { (make) in
			make.top.equalToSuperview()
			make.right.equalToSuperview().offset(-Dimens.large)
			make.width.height.equalTo(44)
		}
		
		productNameLabel.snp.makeConstraints { (make) in
			make.top.equalToSuperview().offset(12)
			make.left.equalToSuperview().offset(Dimens.large)
			make.right.equalTo(productLikeButton.snp.left).offset(-Dimens.default)
		}
	}
	
}

extension ProductDetailNameCell {
	
	@objc func didTapLove(_ sender: UIButton) {
		sender.isSelected = !sender.isSelected
		delegate?.didSelectLove(loved: sender.isSelected)
	}
	
}

extension ProductDetailNameCell: ListItemSizable {
	
	static func height() -> CGFloat {
		return 44
	}
	
	static func height(width: CGFloat, viewModel: ProductDetailNameCellViewModel) -> CGFloat {
		return max(height(), TextSize.size(viewModel.getName(), font: productNameFont, width: width - ((Dimens.large * 2) + Dimens.default + 44)).height + Dimens.large)
	}
	
}

extension ProductDetailNameCell: ListBindable {
	
	func bindViewModel(_ viewModel: Any) {
		guard let viewModel = viewModel as? ProductDetailNameCellViewModel else { return }
		productNameLabel.text = viewModel.getName()
		productLikeButton.isSelected = viewModel.getLikeStatus() == true
	}
	
}
