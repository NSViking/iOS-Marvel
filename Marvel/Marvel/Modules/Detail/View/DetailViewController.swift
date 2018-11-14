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
	var scrollView = UIScrollView()
	
	var presenter: DetailPresenterContract?
	
	var detailHeader = DetailHeaderView()
	var detailDescriptionLabel = UILabel()
	var copyrightLabel = UILabel()
	
	override func viewDidLoad() {
		setupUI()
		setupData()
	}
	
	func setupData() {
		self.presenter?.setupData()
	}
}

extension DetailViewController: DetailViewContract {
	func renderData(comicViewModel: ComicViewModel) {
		self.detailHeader.configure(title: comicViewModel.title,
									price: comicViewModel.price,
									imageURL: comicViewModel.image)
		self.detailDescriptionLabel.text = comicViewModel.description
		
	}
	
	
}
