//
//  HomeViewContract.swift
//  Marvel
//
//  Created by Víctor Vicente on 11/11/2018.
//  Copyright © 2018 DevSouls. All rights reserved.
//

import Foundation

@objc protocol HomeViewContract {
	func reloadData()
	func showError()
}

enum FilterType: String {
    case comic = "comic"
    case magazine = "magazine"
    case hardcover = "hardcover"
    case digital = "digital comic"
}
