//
//  HomePresenter.swift
//  Marvel
//
//  Created by Víctor Vicente on 11/11/2018.
//  Copyright © 2018 DevSouls. All rights reserved.
//

import Foundation
import RxSwift

class HomePresenter {
	
	var router: HomeRouterContract
	var interactor: HomeInteractorContract
	weak var view: HomeViewContract?
	
	private var dataSource: [Comic]
	
	private let filtersArray: [String]
	private var filterSelected: String?
	
	//RxSwift
	let disposeBag = DisposeBag()
	
	init(interactor: HomeInteractorContract,
		 view: HomeViewContract,
		 router: HomeRouterContract) {
		self.interactor = interactor
		self.view = view
		self.router = router
		
		self.dataSource = []
		self.filtersArray = ["All", "comic", "magazine", "hardcover", "digital comic", "digest", "infinite comic"]
	}
}

extension HomePresenter: HomePresenterContract {
	
	func setupDataSource(comicArray: [Comic]) {
		self.dataSource = comicArray
	}
	
	func goToDetail(index: Int) {
		
		let comicK = self.dataSource[index]
		self.router.goToComicDetail(comic: comicK)
	}
	
	func setupData() {
		_ = self.interactor.getComics(filter: filterSelected)
			.subscribe(onSuccess: { comicsDataSource in
				self.dataSource = comicsDataSource
				self.view?.reloadData()
			}) { error in
				self.view?.showError()
			}.disposed(by: disposeBag)
	}
	
	func getMoreData() {
		_ = self.interactor.getMoreComics(filter: filterSelected)
			.subscribe(onSuccess: { comicsDataSource in
				self.dataSource.append(contentsOf: comicsDataSource)
				self.view?.reloadData()
			}) { error in
				self.view?.showError()
			}.disposed(by: disposeBag)
	}
	
	func getDataSourceCount() -> Int {
		return self.dataSource.count
	}
	
	func getDataAt(index: Int) -> ComicViewModel {
		let comicK = self.dataSource[index]
		return self.mapComicToViewModel(comic: comicK)
	}
	
	func getFilters() -> [String] {
		return filtersArray
	}
	
	func filterBy(index: Int) {
		if index == 0 {
			self.filterSelected = nil
		} else {
			let filterK = filtersArray[index]
			self.filterSelected = filterK
		}
		self.dataSource = []
		self.view?.reloadData()
		self.setupData()
	}
}

private extension HomePresenter {
	func mapComicToViewModel(comic: Comic) -> ComicViewModel {
		return ComicMapper.mapComicToComicViewModel(comic: comic)
	}
}
