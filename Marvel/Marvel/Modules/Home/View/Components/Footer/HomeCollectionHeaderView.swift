//
//  HomeCollectionHeaderView.swift
//  Marvel
//
//  Created by Víctor Vicente on 13/11/2018.
//  Copyright © 2018 DevSouls. All rights reserved.
//

import Foundation
import UIKit

protocol HomeCollectionHeaderViewDelegate: NSObjectProtocol {
	func filterBy(index: Int)
}

class HomeCollectionHeaderView: UICollectionReusableView {
	private let scrollView = UIScrollView()
	private let stackView = UIStackView()
	
	weak var delegate: HomeCollectionHeaderViewDelegate?
	
	override init(frame: CGRect) {
		super.init(frame: frame)
		setupUI()
	}
	
	required init?(coder aDecoder: NSCoder) {
		super.init(coder: aDecoder)
	}
}

extension HomeCollectionHeaderView {
	func setupUI() {
		setupSubviews()
		setupStackViewProperties()
		setupAutoLayout()
	}
	
	func setupSubviews() {
		self.addSubview(scrollView)
		scrollView.addSubview(stackView)
	}
	
	func setupStackViewProperties() {
		self.stackView.axis = .horizontal
		self.stackView.alignment = .fill
		self.stackView.spacing = 5
	}
	
	func setupAutoLayout() {
		self.stackView.snp.makeConstraints { maker in
			maker.edges.equalToSuperview()
			maker.height.equalToSuperview()
		}
		
		self.scrollView.snp.makeConstraints { maker in
			maker.top.equalToSuperview()
			maker.left.equalToSuperview()
			maker.right.equalToSuperview()
			maker.height.equalTo(30)
		}
	}
	
	func configure(filters: [String]) {
		
		if (self.stackView.arrangedSubviews.count == 0) {
			for (index, element) in filters.enumerated() {
				let button = self.createButtonFor(filter: element)
				button.tag = index
				button.addTarget(self, action: #selector(filterButtonDidPress), for: .touchUpInside)
				self.stackView.addArrangedSubview(button)
				if index == 0 {
					button.isSelected = true
				}
			}
		}
	}
	
	@objc func filterButtonDidPress(sender: UIButton) {
		sender.isSelected = true
		self.deselectAllFiltersLess(selectedButton: sender)
		delegate?.filterBy(index: sender.tag)
	}
}

private extension HomeCollectionHeaderView {
	
	func deselectAllFiltersLess(selectedButton: UIButton) {
		for view in self.stackView.arrangedSubviews {
			if view.tag != selectedButton.tag {
				let button = view as? UIButton
				button?.isSelected = false
			}
		}
	}
	
	func createButtonFor(filter: String) -> UIButton {
		let buttonFilter = RoundedButton()
		buttonFilter.setTitle("   \(filter)   ", for: .normal)
		buttonFilter.snp.makeConstraints { maker in
			maker.height.equalTo(30)
		}
		return buttonFilter
	}
}
