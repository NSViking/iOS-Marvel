//
//  ComicsRepositoryTests.swift
//  MarvelTests
//
//  Created by Víctor Vicente on 11/11/2018.
//  Copyright © 2018 DevSouls. All rights reserved.
//

import Foundation
import XCTest
import Moya
import RxSwift
import RxBlocking
import Mockit

@testable import Marvel

class UserRepositoryTests: XCTestCase {
	
	var mockClient: HTTPClientMock!
	var repo: ComicsRepository!
	
	override func setUp() {
		mockClient = HTTPClientMock(testCase: self)
		repo = ComicsRepository(httpClient: mockClient)
	}
	
	func testGetComics() {
		
		let comic = ComicData(id: 0,
							   title: "",
							   description: "",
							   format: "",
							   thumbnail: nil,
							   images: [],
							   price: "")
		let mockResponse: [ComicData] = [comic]
		let pagination = Pagination(page: 0, total: 5)
		
		let _ = mockClient.when()
			.call(withReturnValue: mockClient.getComics(filter: nil, pagination: pagination))
			.thenReturn(Single.just(mockResponse))
		
		do {
			let results = try self.repo.getComics(filter: nil, pagination: pagination)
				.toBlocking(timeout: 1.0)
				.single()
			
			XCTAssertTrue(results.count > 0)
		} catch {
			XCTFail()
		}
		
		let _ = mockClient.verify(verificationMode: Once()).getComics(filter: nil, pagination: pagination)
	}
}
