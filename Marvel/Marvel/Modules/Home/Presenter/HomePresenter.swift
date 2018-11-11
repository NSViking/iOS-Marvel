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
	
	private var dataSource: [ComicViewModel] = []
	
	//RxSwift
	let disposeBag = DisposeBag()
	
	init(interactor: HomeInteractorContract,
		 view: HomeViewContract,
		 router: HomeRouterContract) {
		self.interactor = interactor
		self.view = view
		self.router = router
	}
}

extension HomePresenter: HomePresenterContract {
	
	func setupDataSource(comicArray: [ComicViewModel]) {
		self.dataSource = comicArray
	}
	
	func goToDetail(index: Int) {
		
		let comicK = self.dataSource[index]
		self.router.goToComicDetail(comicId: comicK.comicId)
	}
	
	func setupData() {
		_ = self.interactor.getComics()
			.subscribe(onSuccess: { comicsDataSource in
				self.dataSource = self.mapArrayToViewModel(comics: comicsDataSource)
				self.view?.reloadData()
			}) { error in
				self.view?.showError()
			}.disposed(by: disposeBag)
	}
	
	func getMoreData() {
		_ = self.interactor.getMoreComics()
			.subscribe(onSuccess: { comicsDataSource in
				self.dataSource = self.mapArrayToViewModel(comics: comicsDataSource)
				self.view?.reloadData()
			}) { error in
				self.view?.showError()
			}.disposed(by: disposeBag)
	}
}

private extension HomePresenter {
	func mapArrayToViewModel(comics: [Comic]) -> [ComicViewModel] {
		let dataSource = comics.map { comic -> ComicViewModel in
			return ComicMapper.mapComicToComicViewModel(comic: comic)
		}
		return dataSource
	}
}
