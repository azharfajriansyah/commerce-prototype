//
//  ProductDetailPurchaseView.swift
//  commerce prototype
//
//  Created by Azhar Fajriansyah on 28/06/20.
//  Copyright © 2020 Azhar Fajriansyah. All rights reserved.
//

import Foundation
import UIKit

class ProductDetailPurchaseView: UIView {
	
	var didSelectBuyAction: (() -> ())?
	
	lazy var productPriceLabel: UILabel = {
		let label = UILabel()
		label.translatesAutoresizingMaskIntoConstraints = false
		label.font = UIFont.systemFont(ofSize: 18)
		label.textColor = UIColor.darkText
		label.numberOfLines = 0
		return label
	}()
	
	lazy var buyButton: UIButton = {
		let button = UIButton(type: .system)
		button.translatesAutoresizingMaskIntoConstraints = false
		button.setTitle("BUY", for: .normal)
		button.setTitleColor(.blue, for: .normal)
		button.layer.cornerRadius = Dimens.small
		button.layer.borderColor = UIColor.blue.cgColor
		button.layer.borderWidth = 1
		button.addTarget(self, action: #selector(didTapBuy(_:)), for: .touchUpInside)
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
		backgroundColor = .white
		
		addSubview(productPriceLabel)
		addSubview(buyButton)
	}
	
	func setupConstraints() {
		buyButton.snp.makeConstraints { (make) in
			make.top.equalToSuperview().offset(Dimens.large)
			make.right.equalToSuperview().offset(-Dimens.large)
			make.width.equalTo(100)
			make.centerY.equalToSuperview()
		}
		
		productPriceLabel.snp.makeConstraints { (make) in
			make.centerY.equalTo(buyButton.snp.centerY)
			make.right.equalTo(buyButton.snp.left).offset(-Dimens.large)
		}
	}
	
	@objc func didTapBuy(_ sender: UIButton) {
		didSelectBuyAction?()
	}
	
	func configure(price: String?, didSelectBuyAction: (() -> ())?) {
		self.productPriceLabel.text = price
		self.didSelectBuyAction = didSelectBuyAction
	}
	
}
