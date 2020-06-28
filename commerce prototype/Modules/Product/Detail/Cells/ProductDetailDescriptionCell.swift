//
//  ProductDetailDescriptionCell.swift
//  commerce prototype
//
//  Created by Azhar Fajriansyah on 28/06/20.
//  Copyright © 2020 Azhar Fajriansyah. All rights reserved.
//

import IGListKit

class ProductDetailDescriptionCell: UICollectionViewCell {
	
	static let productDescriptionFont = UIFont.systemFont(ofSize: 14)
	
	lazy var productDescriptionLabel: UILabel = {
		let label = UILabel()
		label.translatesAutoresizingMaskIntoConstraints = false
		label.font = ProductDetailDescriptionCell.productDescriptionFont
		label.textColor = UIColor.darkText
		label.numberOfLines = 0
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
	
	func setupViews() {
		contentView.addSubview(productDescriptionLabel)
	}
	
	func setupConstraints() {
		productDescriptionLabel.snp.makeConstraints { (make) in
			make.top.left.equalToSuperview().offset(Dimens.large)
			make.center.equalToSuperview()
		}
	}
	
}

extension ProductDetailDescriptionCell: ListItemSizable {
	
	static func height() -> CGFloat {
		return 100
	}
	
	static func height(width: CGFloat, viewModel: ProductDetailDescriptionCellViewModel) -> CGFloat {
		return TextSize.size(viewModel.description ?? "", font: productDescriptionFont, width: width - (Dimens.large * 2)).height + (Dimens.large * 2)
	}
	
}

extension ProductDetailDescriptionCell: ListBindable {
	
	func bindViewModel(_ viewModel: Any) {
		guard let viewModel = viewModel as? ProductDetailDescriptionCellViewModel else { return }
		productDescriptionLabel.text = viewModel.description
	}
	
}
