//
//  HomeViewController.swift
//  Marvel
//
//  Created by Víctor Vicente on 11/11/2018.
//  Copyright © 2018 DevSouls. All rights reserved.
//

import Foundation
import UIKit

class HomeViewController: UIViewController {
	
	lazy var flowLayout: UICollectionViewFlowLayout = UICollectionViewFlowLayout()
	lazy var collectionView: UICollectionView = UICollectionView(frame: .zero, collectionViewLayout: self.flowLayout)
	
	var presenter: HomePresenterContract?
	
	override func viewDidLoad() {
		self.setupUI()
		self.setupData()
	}
	
	func setupData() {
		self.presenter?.setupData()
	}
}

extension HomeViewController: HomeViewContract {
	func showError() {
		
	}
	
	func reloadData() {
		self.collectionView.reloadData()
	}
}

extension HomeViewController: UICollectionViewDataSource {
	func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
		guard let count = self.presenter?.getDataSourceCount() else {
			return 0
		}
		return count
	}
	
	func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
		guard let comicViewModel = self.presenter?.getDataAt(index: indexPath.row) else {
			return UICollectionViewCell()
		}
		
		var cell: HomeCollectionViewCellContract?
		
		if comicViewModel.isEmptyImage() {
			cell = collectionView.dequeueReusableCell(withReuseIdentifier: HomeEmptyImageCollectionViewCell.identifier(), for: indexPath)
				as? HomeEmptyImageCollectionViewCell
		} else {
			cell = collectionView.dequeueReusableCell(withReuseIdentifier: HomeCollectionViewCell.identifier(), for: indexPath)
				as? HomeCollectionViewCell
		}

		cell?.configure(title: comicViewModel.title,
					   imageUrl: comicViewModel.image)
		
		guard let safeCell = cell as? UICollectionViewCell else {
			return UICollectionViewCell()
		}
		
		return safeCell
	}
}

extension HomeViewController: UICollectionViewDelegate {
	func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
		self.presenter?.goToDetail(index: indexPath.row)
	}
}

extension HomeViewController: UICollectionViewDelegateFlowLayout {
	func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
		var numberOfColumns: Int!
		if Devices.isIpadOrIpadScreenSize() {
			numberOfColumns = Devices.isDeviceLandscape() || Devices.isLandscapeForStart() ? 4 : 3
		} else {
			numberOfColumns = 2
		}
		
		let insets = collectionView.contentInset.left + collectionView.contentInset.right
		let width = (collectionView.frame.width / CGFloat(numberOfColumns)) - insets
		return CGSize(width: width, height: 300.0)
	}
}

extension HomeViewController {
	func collectionView(_ collectionView: UICollectionView, layout
		collectionViewLayout: UICollectionViewLayout,
						referenceSizeForFooterInSection section: Int) -> CGSize {
		return CGSize(width:(collectionView.frame.size.width), height: 100.0)
	}
	
	func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, referenceSizeForHeaderInSection section: Int) -> CGSize {
		return CGSize(width:(collectionView.frame.size.width), height: 50.0)
	}
	
	func collectionView(_ collectionView: UICollectionView, viewForSupplementaryElementOfKind kind: String, at indexPath: IndexPath) -> UICollectionReusableView {
		
		if kind == UICollectionView.elementKindSectionFooter {
			guard let view = collectionView.dequeueReusableSupplementaryView(ofKind: UICollectionView.elementKindSectionFooter, withReuseIdentifier: HomeCollectionFooterView.identifier(), for: indexPath) as? HomeCollectionFooterView else {
				return UICollectionReusableView()
			}
			return view
		} else if kind == UICollectionView.elementKindSectionHeader {
			guard let view = collectionView.dequeueReusableSupplementaryView(ofKind: UICollectionView.elementKindSectionHeader, withReuseIdentifier: HomeCollectionHeaderView.identifier(), for: indexPath) as? HomeCollectionHeaderView, let safePresenter = self.presenter else {
				return UICollectionReusableView()
			}
			view.delegate = self
			view.configure(filters: safePresenter.getFilters())
			return view
		}
		return UICollectionReusableView()
	}
	
	func collectionView(_ collectionView: UICollectionView, willDisplaySupplementaryView view: UICollectionReusableView, forElementKind elementKind: String, at indexPath: IndexPath) {
		if elementKind == UICollectionView.elementKindSectionFooter {
			
			guard let footerView = view as? HomeCollectionFooterView else {
					return
			}
			
			footerView.startAnimating()
			self.presenter?.getMoreData()
		}
	}
	
	func collectionView(_ collectionView: UICollectionView, didEndDisplayingSupplementaryView view: UICollectionReusableView, forElementOfKind elementKind: String, at indexPath: IndexPath) {
		if elementKind == UICollectionView.elementKindSectionFooter {
			
			let footerView = collectionView.dequeueReusableSupplementaryView(ofKind: elementKind, withReuseIdentifier: HomeCollectionFooterView.identifier(), for: indexPath) as? HomeCollectionFooterView
			
			footerView?.stopAnimating()
		}
	}
}

extension HomeViewController: HomeCollectionHeaderViewDelegate {
	func filterBy(index: Int) {
		self.presenter?.filterBy(index: index)
	}
}
