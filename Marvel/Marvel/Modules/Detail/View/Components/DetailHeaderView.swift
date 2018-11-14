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
	
	init() {
		super.init(frame: CGRect.zero)
		self.setupUI()
	}
	
	required init?(coder aDecoder: NSCoder) {
		fatalError("init(coder:) has not been implemented")
	}
	
	func configure(title: String, price: String, imageURL: String) {
		titleLabel.text = title
		
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
		setupImageProperties()
		setupTitleProperties()
		setupAutoLayout()
	}
	
	func setupSubviews() {
		self.addSubview(comicImageView)
		self.addSubview(titleLabel)
	}
	
	func setupViewProperties() {
		self.backgroundColor = UIColor.black
	}
	
	func setupImageProperties() {
		self.comicImageView.contentMode = .scaleAspectFit
		self.comicImageView.layer.borderColor = UIColor.white.cgColor
		self.comicImageView.layer.borderWidth = 2
	}
	
	func setupTitleProperties() {
		self.titleLabel.textColor = UIColor.white
		self.titleLabel.font = UIFont.bold(size: 20)
		self.titleLabel.numberOfLines = 0
	}
	
	func setupAutoLayout() {
		self.comicImageView.snp.makeConstraints { maker in
			maker.left.equalToSuperview()
			maker.top.equalToSuperview().offset(20)
			maker.width.equalTo(180)
			maker.height.equalTo(300)
		}
		
		self.titleLabel.snp.makeConstraints { maker in
			maker.right.equalToSuperview()
			maker.top.equalTo(comicImageView.snp.bottom).offset(15)
			maker.left.equalToSuperview()
			maker.bottom.equalToSuperview().offset(-15)
			maker.height.equalTo(100)
		}
	}
}
