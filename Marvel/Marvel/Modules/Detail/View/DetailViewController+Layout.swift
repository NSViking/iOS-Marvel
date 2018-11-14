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
		setupDescriptionProperties()
		setupCopyright()
		setupAutoLayout()
	}
	
	func setupSubviews() {
		self.view.addSubview(scrollView)
		scrollView.addSubview(stackView)
	}
	
	func setupViewProperties() {
		
		self.view.backgroundColor = UIColor.black
		self.navigationController?.navigationBar.prefersLargeTitles = true
	}
	
	func setupStackViewProperties() {
		self.stackView.axis = .vertical
		self.stackView.distribution = .fillProportionally
		self.stackView.spacing = 15
		
		self.stackView.addArrangedSubview(detailHeader)
		self.stackView.addArrangedSubview(detailDescriptionLabel)
		self.stackView.addArrangedSubview(copyrightLabel)
	}
	
	func setupDescriptionProperties() {
		self.detailDescriptionLabel.textColor = UIColor.white
		self.detailDescriptionLabel.font = UIFont.regular(size: 18)
		self.detailDescriptionLabel.numberOfLines = 0
		self.detailDescriptionLabel.textAlignment = .left
	}
	
	func setupCopyright() {
		self.copyrightLabel.text = "Data provided by Marvel. © 2018 MARVEL"
		self.copyrightLabel.textColor = UIColor.white
		self.copyrightLabel.font = UIFont.bold(size: 18)
		self.copyrightLabel.numberOfLines = 0
		self.copyrightLabel.textAlignment = .center
	}
	
	func setupAutoLayout() {
		
		self.stackView.snp.makeConstraints { maker in
			maker.edges.equalToSuperview()
			maker.width.equalToSuperview()
		}
		
		self.scrollView.snp.makeConstraints { maker in
			maker.top.equalToSuperview().offset(120)
			maker.left.equalToSuperview().offset(15)
			maker.right.equalToSuperview().offset(-15)
			maker.bottom.equalToSuperview()
		}
	}
	
}
