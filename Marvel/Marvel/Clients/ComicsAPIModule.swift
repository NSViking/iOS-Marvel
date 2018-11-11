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
	case get(apiKey: String)
}

extension ComicsAPIModule {
	
	static func getProvider(baseurl: String) -> MoyaProvider<ComicsAPIModule> {
		
		let apiProvider = MoyaProvider<ComicsAPIModule>(endpointClosure: {(target: ComicsAPIModule) -> Moya.Endpoint in
			
			let base = URL(string: baseurl)
			
			let url = base?.appendingPathComponent(target.path).absoluteString
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
		case .get(apiKey: _):
			return "/"
		}
	}
	
	public var method: Moya.Method {
		switch self {
		case .get(apiKey: _):
			return .get
		}
	}
	
	public var sampleData: Data {
		return "".data(using: String.Encoding.utf8)!
	}
	
	public var task: Task {
		switch self {
		case .get(let apiKey):
			return .requestParameters(parameters: ["apikey" : apiKey], encoding: URLEncoding.queryString)
		}
	}
	
	public var headers: [String : String]? {
		return nil
	}
}
