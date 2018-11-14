//
//  HomeEmptyImageCollectionViewCell+Layout.swift
//  Marvel
//
//  Created by Víctor Vicente on 12/11/2018.
//  Copyright © 2018 DevSouls. All rights reserved.
//

import Foundation
import UIKit
import SnapKit

extension HomeEmptyImageCollectionViewCell {
	func setupUI() {
		setupSubViews()
		setupAutoLayout()
		setupViewProperties()
		
		setupContainerViewProperties()
		setupComicImageViewProperties()
		setupTitleLabelProperties()
	}
}

private extension HomeEmptyImageCollectionViewCell {
	
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
			maker.top.equalToSuperview()
			maker.left.equalToSuperview()
			maker.right.equalToSuperview()
			maker.height.equalTo(150)
		}
		
		comicTitleLabel.snp.makeConstraints { maker in
			maker.left.equalToSuperview().offset(15)
			maker.right.equalToSuperview().offset(-15)
			maker.bottom.equalTo(containerView.snp.bottom).offset(-15)
		}
	}
	
	func setupViewProperties() {
		backgroundColor = UIColor.clear
	}
	
	func setupContainerViewProperties() {
		self.containerView.backgroundColor = UIColor.midnightBlue()
	}
	
	func setupComicImageViewProperties() {
		comicImageView.contentMode = .scaleAspectFit
		comicImageView.clipsToBounds = true
		comicImageView.backgroundColor = UIColor.midnightBlue()
	}
	
	func setupTitleLabelProperties() {
		comicTitleLabel.numberOfLines = 0
		comicTitleLabel.font = UIFont.boldSystemFont(ofSize: 18)
		comicTitleLabel.textColor = UIColor.white
		comicTitleLabel.textAlignment = .center
	}
}

