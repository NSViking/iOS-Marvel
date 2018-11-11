//
//  HomeInteractor.swift
//  Marvel
//
//  Created by Víctor Vicente on 11/11/2018.
//  Copyright © 2018 DevSouls. All rights reserved.
//

import Foundation
import RxSwift

class HomeInteractor {
	private let repo: ComicsRepositoryContract
	let pagination: Pagination
	
	init(repo: ComicsRepositoryContract,
		 pagination: Pagination) {
		self.repo = repo
		self.pagination = pagination
	}
}

extension HomeInteractor: HomeInteractorContract {

	func getComics() -> Single<[Comic]> {
		return self.repo.getComics(pagination: self.pagination)
	}
	
	func getMoreComics() -> Single<[Comic]> {
		self.pagination.next()
		return self.repo.getComics(pagination: self.pagination)
	}
}
