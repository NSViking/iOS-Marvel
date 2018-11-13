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
	let apiKey = ""
	
	func getComics(filter: String?, pagination: Pagination) -> Single<[ComicData]> {
		
		let timestamp = String(Date().toMilliseconds())
		let hash = self.createMarvelHash(timestamp: timestamp)
		
		return comicsProvider
			.rx
			.request(.get(apiKey: apiKey,
						  limit: pagination.getObjectsPerPage(),
						  offset: pagination.getCurrentPage(),
						  timestamp: timestamp,
						  hash: hash,
						  filter: filter))
			.filterSuccessfulStatusCodes()
			.map(ResponseData.self)
			.map { moyaResponse -> [ComicData] in
				guard let dataResponse = moyaResponse.data else {
					return []
				}
				return dataResponse.results
			}.catchError({ error -> Single<[ComicData]> in
				print(error.localizedDescription)
 				return Single.error(HTTPClientError.genericError)
			})
	}
}

private extension HTTPClient {
	
	func createMarvelHash(timestamp: String) -> String {
		
		let publicKey = apiKey
		let privateKey = ""
		
		let completeString = "\(timestamp)\(privateKey)\(publicKey)"
		
		let md5Data = Hash.md5(string: completeString)
		
		let md5Hex =  md5Data.map { String(format: "%02hhx", $0) }.joined()
		return md5Hex
	}
}
