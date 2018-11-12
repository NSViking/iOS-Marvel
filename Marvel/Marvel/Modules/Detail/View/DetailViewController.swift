//
//  DetailViewController.swift
//  Marvel
//
//  Created by Víctor Vicente on 12/11/2018.
//  Copyright © 2018 DevSouls. All rights reserved.
//

import Foundation
import UIKit

class DetailViewController: UIViewController {
	
	var stackView = UIStackView()
	
	var presenter: DetailPresenterContract?
	
	var detailHeader = DetailHeaderView()
	
	override func viewDidLoad() {
		setupUI()
		setupData()
	}
	
	func setupData() {
		guard let comicViewModel = self.presenter?.getComic() else {
			return
		}
		self.detailHeader.configure(title: comicViewModel.title,
									price: comicViewModel.price,
									imageURL: comicViewModel.image)
	}
}

extension DetailViewController: DetailViewContract {
	
}
