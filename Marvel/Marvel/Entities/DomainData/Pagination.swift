//
//  Pagination.swift
//  Marvel
//
//  Created by Víctor Vicente on 11/11/2018.
//  Copyright © 2018 DevSouls. All rights reserved.
//

import Foundation

class Pagination {
	private var currentPage = 0
	private var objectsPerPage = 5
	
	init() {
		self.currentPage = 0
		self.objectsPerPage = 5
	}
	
	init(page: Int, total: Int) {
		self.currentPage = page
		self.objectsPerPage = total
	}
}

extension Pagination {
	func getCurrentPage() -> Int {
		return self.currentPage
	}
	
	func setCurrentPage(page: Int) {
		self.currentPage = page;
	}
	
	func getObjectsPerPage() -> Int {
		return self.objectsPerPage
	}
	
	func setObjectsPerPage(total: Int) {
		self.objectsPerPage = total;
	}
	
	func next() {
		self.currentPage += objectsPerPage
	}
}
