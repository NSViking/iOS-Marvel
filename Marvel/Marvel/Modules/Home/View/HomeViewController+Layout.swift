//
//  HomeViewController+Layout.swift
//  Marvel
//
//  Created by Víctor Vicente on 11/11/2018.
//  Copyright © 2018 DevSouls. All rights reserved.
//

import Foundation
import UIKit
import SnapKit

extension HomeViewController {
	
	func setupUI() {
		setupTitle()
		setupSubviews()
		setupViewProperties()
		setupCollectionViewProperties()
		setupAutoLayout()
	}
}

private extension HomeViewController {
	
	func setupSubviews() {
		self.view.addSubview(collectionView)
	}
	
	func setupTitle() {
		self.title = "Marvel Comics"
	}
	
	func setupViewProperties() {
		self.view.backgroundColor = UIColor.white
		self.navigationController?.navigationBar.prefersLargeTitles = true
	}
	
	func setupCollectionViewProperties() {
		collectionView.contentInset = UIEdgeInsets(top: 25, left: 25 * 0.5, bottom: 0, right: 25 * 0.5)
		collectionView.backgroundColor = UIColor.white
		collectionView.register(HomeCollectionViewCell.self, forCellWithReuseIdentifier: HomeCollectionViewCell.identifier())
		collectionView.register(HomeCollectionFooterView.self, forSupplementaryViewOfKind: UICollectionView.elementKindSectionFooter, withReuseIdentifier: HomeCollectionFooterView.identifier())

		DispatchQueue.main.async {
			self.collectionView.dataSource = self
			self.collectionView.delegate = self
		}
	}
	
	func setupFlowLayoutProperties() {
		flowLayout.sectionHeadersPinToVisibleBounds = true
		flowLayout.scrollDirection = UICollectionView.ScrollDirection.vertical
		flowLayout.minimumLineSpacing = 0
		flowLayout.minimumInteritemSpacing = 0
	}
	
	func setupAutoLayout() {
		self.collectionView.snp.makeConstraints { maker in
			maker.edges.equalToSuperview()
		}
	}
}
