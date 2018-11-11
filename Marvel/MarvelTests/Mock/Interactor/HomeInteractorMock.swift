//
//  HomeInteractorMock.swift
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

class HomeInteractorMock: NSObject, Mock {
	let callHandler: CallHandler
	
	init(testCase: XCTestCase) {
		callHandler = CallHandlerImpl(withTestCase: testCase)
	}
	
	func instanceType() -> HomeInteractorMock {
		return self
	}
}

extension HomeInteractorMock: HomeInteractorContract {
	func getComics() -> Single<[Comic]> {
		let user = Comic()
		return callHandler.accept(Single.just([user]), ofFunction: #function, atFile: #file, inLine: #line, withArgs: nil) as! Single<[Comic]>
	}
	
	func getMoreComics() -> Single<[Comic]> {
		let user = Comic()
		return callHandler.accept(Single.just([user]), ofFunction: #function, atFile: #file, inLine: #line, withArgs: nil) as! Single<[Comic]>
	}
}
