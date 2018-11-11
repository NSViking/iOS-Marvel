//
//  ComicData.swift
//  Marvel
//
//  Created by Víctor Vicente on 11/11/2018.
//  Copyright © 2018 DevSouls. All rights reserved.
//

import Foundation

class ComicData: Codable {
	var id: String?
	var name: String?
	
	class func decode(data: Data) -> ComicData {
		let decoder = JSONDecoder()
		let userData = try! decoder.decode(ComicData.self, from: data)
		return userData
	}
}
