//
//  HomeInteractorContract.swift
//  Marvel
//
//  Created by Víctor Vicente on 11/11/2018.
//  Copyright © 2018 DevSouls. All rights reserved.
//

import Foundation
import RxSwift

protocol HomeInteractorContract {
	func getComics() -> Single<[Comic]>
	func getMoreComics() -> Single<[Comic]>
}

enum HomeInteractorError: Swift.Error, CustomStringConvertible {
	var description: String { return "HomeInteractorError error" }
	case generic
}
