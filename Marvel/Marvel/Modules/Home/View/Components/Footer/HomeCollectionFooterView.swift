//
//  HomeCollectionFooterView.swift
//  Marvel
//
//  Created by Víctor Vicente on 11/11/2018.
//  Copyright © 2018 DevSouls. All rights reserved.
//

import Foundation
import UIKit

let kFooterViewTag = 1989

class HomeCollectionFooterView: UICollectionReusableView {
	private let loading = UIActivityIndicatorView()
	
	override init(frame: CGRect) {
		super.init(frame: frame)
		setupUI()
	}
	
	required init?(coder aDecoder: NSCoder) {
		super.init(coder: aDecoder)
	}
}

extension HomeCollectionFooterView {
	
	func startAnimating() {
		self.loading.startAnimating()
	}
	
	func stopAnimating() {
		self.loading.stopAnimating()
		self.loading.removeFromSuperview()
	}
	
	func setupUI() {
		self.addSubview(loading)
		setupLoading()
		setupAutolayout()
	}
	
	func setupLoading() {
		loading.style = .white
		loading.translatesAutoresizingMaskIntoConstraints = false
		loading.tintColor = UIColor.gray
		loading.tag = kFooterViewTag
	}
	
	func setupAutolayout() {
		self.loading.snp.makeConstraints { maker in
			maker.centerX.equalToSuperview()
			maker.centerY.equalToSuperview()
		}
	}
}
