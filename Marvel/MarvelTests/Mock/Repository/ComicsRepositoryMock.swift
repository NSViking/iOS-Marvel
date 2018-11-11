//
//  ComicsRepositoryMock.swift
//  MarvelTests
//
//  Created by Víctor Vicente on 11/11/2018.
//  Copyright © 2018 DevSouls. All rights reserved.
//

import Foundation

import RxSwift
import Moya
import Mockit
import XCTest

@testable import Marvel

class ComicsRepositoryMock: NSObject, Mock {
	let callHandler: CallHandler
	
	init(testCase: XCTestCase) {
		callHandler = CallHandlerImpl(withTestCase: testCase)
	}
	
	func instanceType() -> ComicsRepositoryMock {
		return self
	}
}

extension ComicsRepositoryMock: ComicsRepositoryContract {
	func getComics(pagination: Pagination) -> Single<[Comic]> {
		let user = Comic()
		return callHandler.accept(Single.just([user]), ofFunction: #function, atFile: #file, inLine: #line, withArgs: nil) as! Single<[Comic]>
	}
}
