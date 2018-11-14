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
	
	var comicsProvider: MoyaProvider<ComicsAPIModule>?
	var apiKey = ""
	var apiSecret = ""
	
	init() {
		if let path = Bundle.main.path(forResource: "env", ofType: "json") {
			do {
				let data = try Data(contentsOf: URL(fileURLWithPath: path), options: .mappedIfSafe)
				let jsonResult = try JSONSerialization.jsonObject(with: data, options: .mutableLeaves)
				if let jsonResult = jsonResult as? Dictionary<String, String>,
					let apiKey = jsonResult["apiKey"],
					let apiSecret = jsonResult["apiSecret"],
					let endpoint = jsonResult["endpoint"] {
			
					self.apiKey = apiKey
					self.apiSecret = apiSecret
					
					comicsProvider = ComicsAPIModule.getProvider(baseurl: endpoint)

				}
			} catch {
				
			}
		}
	}
	
	func getComics(filter: String?, pagination: Pagination) -> Single<[ComicData]> {
		
		let timestamp = String(Date().toMilliseconds())
		let hash = self.createMarvelHash(timestamp: timestamp)
		
		return comicsProvider?
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
			}) ?? Single.error(HTTPClientError.nonProvider)
	}
}

private extension HTTPClient {
	
	func createMarvelHash(timestamp: String) -> String {
		
		let publicKey = apiKey
		let privateKey = apiSecret
		
		let completeString = "\(timestamp)\(privateKey)\(publicKey)"
		
		let md5Data = Hash.md5(string: completeString)
		
		let md5Hex =  md5Data.map { String(format: "%02hhx", $0) }.joined()
		return md5Hex
	}
}
