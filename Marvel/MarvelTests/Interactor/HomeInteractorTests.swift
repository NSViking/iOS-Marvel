//
//  HomeInteractorTests.swift
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

class HomeInteractorTests: XCTestCase {
	
	var mockRepo: ComicsRepositoryMock!
	var pagination: Pagination!
	var interactor: HomeInteractor!
	
	override func setUp() {
		self.mockRepo = ComicsRepositoryMock(testCase: self)
		self.pagination = Pagination()
		
		self.interactor = HomeInteractor(repo: self.mockRepo,
										 pagination: self.pagination)
	}

	func testGetComics() {
		
		let mockResponse: [Comic] = []
		let _ = mockRepo.when()
			.call(withReturnValue: mockRepo.getComics(pagination: pagination))
			.thenReturn(Single.just(mockResponse))
		
		do {
			let results = try self.interactor.getComics()
				.toBlocking()
				.single()
			XCTAssertTrue(results.count == 0)
			XCTAssertTrue(self.interactor.pagination.getCurrentPage() == 0)
		} catch {
			XCTFail()
		}
		
		let _ = mockRepo.verify(verificationMode: Once()).getComics(pagination: pagination)
	}
	
	func testGetMoreUsers() {
		
		let mockResponse: [Comic] = []
		let _ = mockRepo.when()
			.call(withReturnValue: mockRepo.getComics(pagination: pagination))
			.thenReturn(Single.just(mockResponse))
		
		do {
			let results = try self.interactor.getMoreComics()
				.toBlocking()
				.single()
			XCTAssertTrue(results.count == 0)
			XCTAssertTrue(self.interactor.pagination.getCurrentPage() == 6)
		} catch {
			XCTFail()
		}
		
		let _ = mockRepo.verify(verificationMode: Once()).getComics(pagination: pagination)
	}
}
