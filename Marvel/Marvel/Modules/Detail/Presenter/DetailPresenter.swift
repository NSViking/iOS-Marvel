//
//  DetailPresenter.swift
//  Marvel
//
//  Created by Víctor Vicente on 12/11/2018.
//  Copyright © 2018 DevSouls. All rights reserved.
//

import Foundation

class DetailPresenter {
	
	private let comic: Comic
	weak var view: DetailViewContract?
	
	init(comic: Comic, view: DetailViewContract) {
		self.comic = comic
		self.view = view
	}
}

extension DetailPresenter: DetailPresenterContract {

	func setupData() {
		let viewModel = self.mapComicToViewModel(comics: self.comic)
		self.view?.renderData(comicViewModel: viewModel)
	}
}

private extension DetailPresenter {
	func mapComicToViewModel(comics: Comic) -> ComicViewModel {
		return ComicMapper.mapComicToComicViewModel(comic: comic)
	}
}
