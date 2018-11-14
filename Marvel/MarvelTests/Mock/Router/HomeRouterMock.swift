//
//  HomeRouterMock.swift
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

class HomeRouterMock: NSObject, Mock {
	let callHandler: CallHandler
	
	init(testCase: XCTestCase) {
		callHandler = CallHandlerImpl(withTestCase: testCase)
	}
	
	func instanceType() -> HomeRouterMock {
		return self
	}
}

extension HomeRouterMock: HomeRouterContract {
	func goToComicDetail(comic: Comic) {
		callHandler.accept(nil, ofFunction: #function, atFile: #file, inLine: #line, withArgs: nil)
	}
}
