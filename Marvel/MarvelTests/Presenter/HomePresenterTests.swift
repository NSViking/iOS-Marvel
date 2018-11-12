//
//  HomePresenterTests.swift
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

class HomePresenterTests: XCTestCase {

	var mockRouter: HomeRouterMock!
	var mockView: HomeViewMock!
	var mockInteractor: HomeInteractorMock!
	var presenter: HomePresenter!
	
	override func setUp() {
		mockRouter = HomeRouterMock(testCase: self)
		mockView = HomeViewMock(testCase: self)
		mockInteractor = HomeInteractorMock(testCase: self)
		
		self.presenter = HomePresenter(interactor: mockInteractor,
									   view: mockView,
									   router: mockRouter)
	}
	
	func testSetupData() {
		
		presenter.setupData()
		
		let _ = mockInteractor.verify(verificationMode: Once()).getComics()
		let _ = mockView.verify(verificationMode: Once()).reloadData()
	}
	
	func testSetupDataWrong() {
		
		let _ = mockInteractor.when()
			.call(withReturnValue: mockInteractor.getComics())
			.thenReturn(Single.error(HomeInteractorError.generic))
		
		presenter.setupData()
		
		let _ = mockInteractor.verify(verificationMode: Once()).getComics()
		let _ = mockView.verify(verificationMode: Once()).showError()
	}
	
	func testGetMoreData() {
		
		presenter.getMoreData()
		
		let _ = mockInteractor.verify(verificationMode: Once()).getMoreComics()
		let _ = mockView.verify(verificationMode: Once()).reloadData()
	}
	
	func testGetMoreDataWrong() {
		
		let _ = mockInteractor.when()
			.call(withReturnValue: mockInteractor.getMoreComics())
			.thenReturn(Single.error(HomeInteractorError.generic))
		
		presenter.getMoreData()
		
		let _ = mockInteractor.verify(verificationMode: Once()).getMoreComics()
		let _ = mockView.verify(verificationMode: Once()).showError()
	}
	
	func testGoToDetail() {
		
		self.presenter.setupDataSource(comicArray: [Comic()])
		presenter.goToDetail(index: 0)
		
		let _ = mockRouter.verify(verificationMode: Once()).goToComicDetail(comic: Comic())
	}
}
