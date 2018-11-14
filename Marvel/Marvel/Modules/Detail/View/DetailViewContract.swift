//
//  DetailViewContract.swift
//  Marvel
//
//  Created by Víctor Vicente on 12/11/2018.
//  Copyright © 2018 DevSouls. All rights reserved.
//

import Foundation

protocol DetailViewContract: NSObjectProtocol {
	func renderData(comicViewModel: ComicViewModel)
}
