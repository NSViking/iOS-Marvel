//
//  DetailPresenterTests.swift
//  MarvelTests
//
//  Created by Víctor Vicente on 14/11/2018.
//  Copyright © 2018 DevSouls. All rights reserved.
//

import Foundation
import XCTest
import Moya
import RxSwift
import RxBlocking
import Mockit

@testable import Marvel

class DetailPresenterTests: XCTestCase {
	
	var mockView: DetailViewMock!
	var presenter: DetailPresenter!
	
	override func setUp() {
		mockView = DetailViewMock(testCase: self)
		
		self.presenter = DetailPresenter(comic: Comic(),
										 view: mockView)
	}
	
	func testSetupData() {
		presenter.setupData()
		
		let _ = mockView.verify(verificationMode: Once()).renderData(comicViewModel: ComicViewModel())
	}
}
