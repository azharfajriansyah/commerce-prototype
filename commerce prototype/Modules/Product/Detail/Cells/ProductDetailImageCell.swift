//
//  ProductDetailImageCell.swift
//  commerce prototype
//
//  Created by Azhar Fajriansyah on 28/06/20.
//  Copyright © 2020 Azhar Fajriansyah. All rights reserved.
//

import IGListKit

class ProductDetailImageCell: UICollectionViewCell {
    
	lazy var productImageView: UIImageView = {
		let imageView = UIImageView()
		imageView.translatesAutoresizingMaskIntoConstraints = false
		imageView.contentMode = .scaleAspectFit
		imageView.clipsToBounds = true
		return imageView
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
		contentView.addSubview(productImageView)
	}
	
	func setupConstraints() {
		productImageView.snp.makeConstraints { (make) in
			make.edges.equalToSuperview()
		}
	}
	
}

extension ProductDetailImageCell: ListItemSizable {
	
	static func height() -> CGFloat {
		return 150
	}
	
}

extension ProductDetailImageCell: ListBindable {
	
	func bindViewModel(_ viewModel: Any) {
		guard let viewModel = viewModel as? ProductDetailImageCellViewModel else { return }
		productImageView.sd_setImage(with: viewModel.getImageURL(), completed: nil)
	}
	
}
