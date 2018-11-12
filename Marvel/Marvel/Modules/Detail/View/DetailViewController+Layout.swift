//
//  DetailViewController+Layout.swift
//  Marvel
//
//  Created by Víctor Vicente on 12/11/2018.
//  Copyright © 2018 DevSouls. All rights reserved.
//

import Foundation
import UIKit

extension DetailViewController {
	
	func setupUI() {
		setupSubviews()
		setupViewProperties()
		setupStackViewProperties()
		setupAutoLayout()
	}
	
	func setupSubviews() {
		self.view.addSubview(stackView)
	}
	
	func setupViewProperties() {
		
		self.view.backgroundColor = UIColor.black
		self.navigationController?.navigationBar.prefersLargeTitles = true
	}
	
	func setupStackViewProperties() {
		self.stackView.axis = .vertical
		
		self.stackView.addArrangedSubview(detailHeader)
	}
	
	func setupAutoLayout() {
		self.stackView.snp.makeConstraints { maker in
			maker.top.equalToSuperview().offset(120)
			maker.bottom.equalToSuperview()
			maker.left.equalToSuperview()
			maker.right.equalToSuperview()
		}
	}
	
}
