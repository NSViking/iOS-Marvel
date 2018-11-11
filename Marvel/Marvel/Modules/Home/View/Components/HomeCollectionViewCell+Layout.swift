//
//  HomeCollectionViewCell+Layout.swift
//  Marvel
//
//  Created by Víctor Vicente on 11/11/2018.
//  Copyright © 2018 DevSouls. All rights reserved.
//

import Foundation
import UIKit
import SnapKit

extension HomeCollectionViewCell {
	func setupUI() {
		setupSubViews()
		setupAutoLayout()
		setupViewProperties()
		
		setupContainerViewProperties()
		setupComicImageViewProperties()
		setupTitleLabelProperties()
	}
}

private extension HomeCollectionViewCell {
	
	func setupSubViews() {
		self.contentView.addSubview(containerView)
		self.contentView.addSubview(comicImageView)
		self.contentView.addSubview(comicTitleLabel)
	}
	
	func setupAutoLayout() {
		containerView.snp.makeConstraints { maker in
			maker.edges.equalToSuperview()
		}
		
		comicImageView.snp.makeConstraints { maker in
			maker.top.equalToSuperview().offset(15)
			maker.centerX.equalToSuperview()
			maker.width.equalTo(120)
			maker.height.equalTo(120)
		}
		
		comicTitleLabel.snp.makeConstraints { maker in
			maker.left.equalToSuperview().offset(15)
			maker.right.equalToSuperview().offset(-15)
			maker.top.equalTo(comicImageView.snp.bottom).offset(8)
		}
		
	}
	
	func setupViewProperties() {
		backgroundColor = UIColor.clear
	}
	
	func setupContainerViewProperties() {
		self.containerView.layer.cornerRadius = 15
		self.containerView.clipsToBounds = true
		self.containerView.backgroundColor = UIColor.lightGray()
	}
	
	func setupComicImageViewProperties() {
		comicImageView.contentMode = .scaleAspectFit
		comicImageView.backgroundColor = UIColor.midnightBlue()
	}
	
	func setupTitleLabelProperties() {
		comicTitleLabel.numberOfLines = 2
		comicTitleLabel.font = UIFont.boldSystemFont(ofSize: 18)
		comicTitleLabel.textColor = UIColor.black
		comicTitleLabel.textAlignment = .center
	}
}

