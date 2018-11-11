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
import Mockit

@testable import Marvel

class UserRepositoryTests: XCTestCase {
	
	var mockClient: HTTPClientMock!
	
	override func setUp() {
		mockClient = HTTPClientMock(testCase: self)
	}
	
	func testGetComics() {

	}
}
