//
//  HTTPClientMock.swift
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

class HTTPClientMock: NSObject, Mock {
	let callHandler: CallHandler
	
	init(testCase: XCTestCase) {
		callHandler = CallHandlerImpl(withTestCase: testCase)
	}
	
	func instanceType() -> HTTPClientMock {
		return self
	}
}

extension HTTPClientMock: HTTPClientContract {
	
	func getComics(pagination: Pagination) -> Single<[ComicData]> {
		let userData = ComicData(id: 0,
								 title: "",
								 description: "",
								 format: "",
								 thumbnail: nil,
								 images: [])
		
		return callHandler.accept(Single.just([userData]), ofFunction: #function, atFile: #file, inLine: #line, withArgs: nil) as! Single<[ComicData]>
	}
}
