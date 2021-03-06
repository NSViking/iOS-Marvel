//
//  HomePresenterContract.swift
//  Marvel
//
//  Created by Víctor Vicente on 11/11/2018.
//  Copyright © 2018 DevSouls. All rights reserved.
//

import Foundation

protocol HomePresenterContract {
	func setupData()
	func getMoreData()
	
	func goToDetail(index: Int)
	
	func getDataSourceCount() -> Int
	func getDataAt(index: Int) -> ComicViewModel
	
	func getFilters() -> [String]
	
	func filterBy(index: Int)
}
