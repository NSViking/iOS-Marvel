//
//  ComicsAPIModuleTests.swift
//  MarvelTests
//
//  Created by Víctor Vicente on 11/11/2018.
//  Copyright © 2018 DevSouls. All rights reserved.
//

import Foundation
import XCTest
import Moya

@testable import Marvel

class ComicsAPIModuleTests: XCTestCase {
	
	func testGetComicsEndpoint() {
		
		let baseUrl = "https://gateway.marvel.com:443/v1/public/comics"
		let apiKey = "randomApiKey"
		let limit = 5
		let offset = 0
		
		let endpoint = ComicsAPIModule
			.getProvider(baseurl: baseUrl)
			.endpoint(ComicsAPIModule.get(apiKey: apiKey, limit: limit, offset: offset))
		XCTAssertTrue(endpoint.method == .get)
		let completeURL = try! endpoint.urlRequest().url?.absoluteString
		XCTAssertTrue(completeURL == "\(baseUrl)/?apikey=\(apiKey)&limit=\(limit)&offset=\(offset)")
	}
}
