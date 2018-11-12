//
//  DetailHeaderView.swift
//  Marvel
//
//  Created by Víctor Vicente on 12/11/2018.
//  Copyright © 2018 DevSouls. All rights reserved.
//

import Foundation
import UIKit

class DetailHeaderView: UIView {
	
	let comicImageView = UIImageView()
	let titleLabel = UILabel()
	let priceLabel = UILabel()
	
	init() {
		super.init(frame: CGRect.zero)
		self.setupUI()
	}
	
	required init?(coder aDecoder: NSCoder) {
		fatalError("init(coder:) has not been implemented")
	}
	
	func configure(title: String, price: String, imageURL: String) {
		titleLabel.text = title
		priceLabel.text = price
		
		if let url = URL(string: imageURL) {
			comicImageView.af_setImage(withURL: url,
									   imageTransition: .crossDissolve(0.2))
		}
	}
}

extension DetailHeaderView {
	
	func setupUI()
	{
		setupSubviews()
		setupViewProperties()
		setupTitleProperties()
		setupPriceProperties()
		setupAutoLayout()
	}
	
	func setupSubviews() {
		self.addSubview(comicImageView)
		self.addSubview(titleLabel)
		self.addSubview(priceLabel)
	}
	
	func setupViewProperties() {
		self.backgroundColor = UIColor.black
	}
	
	func setupTitleProperties() {
		self.titleLabel.textColor = UIColor.white
		self.titleLabel.font = UIFont.bold(size: 20)
		self.titleLabel.numberOfLines = 0
	}
	
	func setupPriceProperties() {
		self.priceLabel.textColor = UIColor.white
		self.priceLabel.font = UIFont.bold(size: 24)
		self.priceLabel.numberOfLines = 0
	}
	
	func setupAutoLayout() {
		self.comicImageView.snp.makeConstraints { maker in
			maker.left.equalToSuperview().offset(15)
			maker.top.equalToSuperview().offset(15)
			maker.width.equalTo(180)
			maker.height.equalTo(300)
		}
		
		self.titleLabel.snp.makeConstraints { maker in
			maker.left.equalTo(comicImageView.snp.right).offset(15)
			maker.right.equalToSuperview().offset(-15)
			maker.top.equalToSuperview().offset(15)
		}

		self.priceLabel.snp.makeConstraints { maker in
			maker.left.equalTo(comicImageView.snp.right).offset(15)
			maker.right.equalToSuperview().offset(-15)
			maker.top.equalTo(titleLabel.snp.bottom).offset(15)
		}
	}
}
