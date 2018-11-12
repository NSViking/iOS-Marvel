//
//  ComicsRepository.swift
//  Marvel
//
//  Created by Víctor Vicente on 11/11/2018.
//  Copyright © 2018 DevSouls. All rights reserved.
//

import Foundation
import RxSwift

class ComicsRepository {
	
	var httpClient: HTTPClientContract
	
	init(httpClient: HTTPClientContract) {
		self.httpClient = httpClient
	}
}

extension ComicsRepository: ComicsRepositoryContract {
	
	func getComics(pagination: Pagination) -> Single<[Comic]> {
		return self.httpClient
			.getComics(pagination: pagination)
			.map { comicsDataArray -> [Comic] in
				return comicsDataArray.map { comicData -> Comic in
					return ComicMapper.mapComicDataToComic(comicData: comicData)
				}
			}.catchError { error -> Single<[Comic]> in
				return Single.error(ComicsRepositoryError.generic)
		}
	}
}
