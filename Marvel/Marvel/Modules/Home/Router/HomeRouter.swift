//
//  HomeRouter.swift
//  Marvel
//
//  Created by Víctor Vicente on 11/11/2018.
//  Copyright © 2018 DevSouls. All rights reserved.
//

import Foundation
import UIKit

class HomeRouter {
	
	var viewController: UIViewController
	
	init(view: UIViewController) {
		viewController = view
	}
}

extension HomeRouter: HomeRouterContract {
	
	func goToComicDetail(comic: Comic) {
		let detailVC = DetailConfigurator.createDetailStack(comic: comic)
		
		self.viewController.navigationController?.pushViewController(detailVC, animated: true)
	}
}
