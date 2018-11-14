//
//  DetailViewMock.swift
//  MarvelTests
//
//  Created by Víctor Vicente on 14/11/2018.
//  Copyright © 2018 DevSouls. All rights reserved.
//

import Foundation
import RxSwift
import Moya
import Mockit
import XCTest

@testable import Marvel

class DetailViewMock: NSObject, Mock {
	let callHandler: CallHandler
	
	init(testCase: XCTestCase) {
		callHandler = CallHandlerImpl(withTestCase: testCase)
	}
	
	func instanceType() -> DetailViewMock {
		return self
	}
}

extension DetailViewMock: DetailViewContract {
	func renderData(comicViewModel: ComicViewModel) {
		callHandler.accept(nil, ofFunction: #function, atFile: #file, inLine: #line, withArgs: nil)
	}
}
