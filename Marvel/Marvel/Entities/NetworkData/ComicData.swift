//
//  ComicData.swift
//  Marvel
//
//  Created by Víctor Vicente on 11/11/2018.
//  Copyright © 2018 DevSouls. All rights reserved.
//

import Foundation

struct ComicData: Codable {
	var id: Int?
	var title: String?
	var description: String?
	var format: String?
	var thumbnail: ImageData?
	var images: [ImageData]
	
	static func decode(data: Data) -> ComicData {
		let decoder = JSONDecoder()
		let userData = try! decoder.decode(ComicData.self, from: data)
		return userData
	}
}
