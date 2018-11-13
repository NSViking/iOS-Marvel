//
//  ComicsAPIModule.swift
//  Marvel
//
//  Created by Víctor Vicente on 11/11/2018.
//  Copyright © 2018 DevSouls. All rights reserved.
//

import Foundation
import Moya
import RxSwift

public enum ComicsAPIModule {
	case get(apiKey: String, limit: Int, offset: Int, timestamp: String, hash: String, filter: String?)
}

extension ComicsAPIModule {
	
	static func getProvider(baseurl: String) -> MoyaProvider<ComicsAPIModule> {
		
		let apiProvider = MoyaProvider<ComicsAPIModule>(endpointClosure: {(target: ComicsAPIModule) -> Moya.Endpoint in
			
			let base = URL(string: baseurl)
			
			let url = base?.absoluteString
			let endpoint: Moya.Endpoint = Endpoint(url: url!, sampleResponseClosure: { .networkResponse(200, target.sampleData) }, method: target.method, task: target.task, httpHeaderFields: target.headers)
			
			return endpoint
		})
		
		return apiProvider
	}
}

extension ComicsAPIModule: Moya.TargetType {
	
	public var baseURL: URL {
		return URL(string: "https://not.in.use/")!
	}
	
	public var path: String {
		switch self {
		case .get(apiKey: _, _, _, _, _, _):
			return ""
		}
	}
	
	public var method: Moya.Method {
		switch self {
		case .get(apiKey: _,  _, _, _, _, _):
			return .get
		}
	}
	
	public var sampleData: Data {
		return "".data(using: String.Encoding.utf8)!
	}
	
	public var task: Task {
		switch self {
		case .get(let apiKey,
				  let limit,
				  let offset,
				  let timestamp,
				  let hash,
				  let filter):
			
			if let safeFilter = filter {
				return .requestParameters(parameters: ["limit": limit,
													   "offset": offset,
													   "apikey" : apiKey,
													   "ts": timestamp,
													   "hash": hash,
													   "format": safeFilter],
										  encoding: URLEncoding.queryString)
			} else {
				return .requestParameters(parameters: ["limit": limit,
													   "offset": offset,
													   "apikey" : apiKey,
													   "ts": timestamp,
													   "hash": hash],
										  encoding: URLEncoding.queryString)
			}
		}
	}
	
	public var headers: [String : String]? {
		return nil
	}
}
