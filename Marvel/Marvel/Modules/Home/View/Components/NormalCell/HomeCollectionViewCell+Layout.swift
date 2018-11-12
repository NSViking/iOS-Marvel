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
		setupGradientViewProperties()
		setupComicImageViewProperties()
		setupTitleLabelProperties()
	}
}

private extension HomeCollectionViewCell {
	
	func setupSubViews() {
		self.contentView.addSubview(containerView)
		self.contentView.addSubview(comicImageView)
		self.contentView.addSubview(gradientView)
		self.contentView.addSubview(comicTitleLabel)
	}
	
	func setupAutoLayout() {
		containerView.snp.makeConstraints { maker in
			maker.edges.equalToSuperview()
		}
		
		comicImageView.snp.makeConstraints { maker in
			maker.edges.equalToSuperview()
		}
		
		comicTitleLabel.snp.makeConstraints { maker in
			maker.left.equalToSuperview().offset(15)
			maker.right.equalToSuperview().offset(-15)
			maker.bottom.equalTo(containerView.snp.bottom).offset(-15)
		}
		
		gradientView.snp.makeConstraints { maker in
			maker.left.equalToSuperview()
			maker.top.equalToSuperview()
			maker.right.equalToSuperview()
			maker.bottom.equalToSuperview()
		}
	}
	
	func setupViewProperties() {
		backgroundColor = UIColor.clear
	}
	
	func setupContainerViewProperties() {
		self.containerView.backgroundColor = UIColor.midnightBlue()
	}
	
	private func setupGradientViewProperties() {
		gradientView.clipsToBounds = true
		let startColor = UIColor.midnightBlue(alpha: 0).cgColor
		let endColor = UIColor.midnightBlue(alpha: 1).cgColor
		gradientLayer.colors = [startColor, endColor]
		gradientLayer.locations = [0, 1]
		gradientView.layer.addSublayer(gradientLayer)
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

