//
//  HTTPClient.swift
//  Marvel
//
//  Created by Víctor Vicente on 11/11/2018.
//  Copyright © 2018 DevSouls. All rights reserved.
//

import Foundation
import Moya
import RxSwift

class HTTPClient: HTTPClientContract {
	
	let comicsProvider = ComicsAPIModule.getProvider(baseurl: "https://gateway.marvel.com:443/v1/public/comics")
	let apiKey = "114573488c8d05ec18053e0f6a278377"
	
	func getComics(pagination: Pagination) -> Single<[ComicData]> {
		
		return comicsProvider
			.rx
			.request(.get(apiKey: apiKey,
						  limit: pagination.getObjectsPerPage(),
						  offset: pagination.getCurrentPage()))
			.filterSuccessfulStatusCodes()
			.map(ResponseData.self)
			.map { moyaResponse -> [ComicData] in
				guard let dataResponse = moyaResponse.data else {
					return []
				}
				return dataResponse.results
			}.catchError({ error -> Single<[ComicData]> in
				return Single.error(HTTPClientError.genericError)
			})
	}
}
