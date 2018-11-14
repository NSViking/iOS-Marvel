//
//  ComicsRepositoryContract.swift
//  Marvel
//
//  Created by Víctor Vicente on 11/11/2018.
//  Copyright © 2018 DevSouls. All rights reserved.
//

import Foundation
import RxSwift

protocol ComicsRepositoryContract {
	func getComics(filter: String?,
				   pagination: Pagination) -> Single<[Comic]>
}

enum ComicsRepositoryError: Swift.Error, CustomStringConvertible {
	var description: String { return "ComicsRepositoryError error" }
	case mapping
	case generic
}
