//
//  DetailConfigurator.swift
//  Marvel
//
//  Created by Víctor Vicente on 12/11/2018.
//  Copyright © 2018 DevSouls. All rights reserved.
//

import Foundation

class DetailConfigurator {
	
	class func createDetailStack(comic: Comic) -> DetailViewController {
		
		let detailVC = DetailViewController()
		configure(detailVC, comic)
		
		return detailVC
	}
}

extension DetailConfigurator {
	
	class func configure(_ viewController: DetailViewController,
						 _ comic: Comic) {
		let presenter = DetailPresenter(comic: comic, view: viewController)
		
		viewController.presenter = presenter
	}
}
