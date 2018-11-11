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
		
		let endpoint = ComicsAPIModule.getProvider(baseurl: baseUrl).endpoint(ComicsAPIModule.get())
		XCTAssertTrue(endpoint.method == .get)
		let completeURL = try! endpoint.urlRequest().url?.absoluteString
		XCTAssertTrue(completeURL == "\(baseUrl)/")
	}
}
