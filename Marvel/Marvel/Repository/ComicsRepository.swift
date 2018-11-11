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
	
	func getComics() -> Single<[Comic]> {
		return self.httpClient
			.getComics(url: "")
			.map { comicsDataArray -> [Comic] in
				return comicsDataArray.map { userData -> Comic in
					return Comic()//ComicMapper.mapUserDataToUser(userData: userData)
				}
			}.catchError { error -> Single<[Comic]> in
				return Single.error(ComicsRepositoryError.generic)
		}
	}
}
