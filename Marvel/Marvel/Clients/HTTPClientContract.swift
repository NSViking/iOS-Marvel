//
//  HTTPClientContract.swift
//  Marvel
//
//  Created by Víctor Vicente on 11/11/2018.
//  Copyright © 2018 DevSouls. All rights reserved.
//

import Foundation
import RxSwift

protocol HTTPClientContract {
	func getComics(filter: String?, pagination: Pagination) -> Single<[ComicData]>
}

enum HTTPClientError: Swift.Error, CustomStringConvertible {
	var description: String { return "HTTPClientError.." }
	case noContentError
	case noConnectionError
	case genericError
	case nonProvider
}
