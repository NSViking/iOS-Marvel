//
//  ThumbnailData.swift
//  Marvel
//
//  Created by Víctor Vicente on 11/11/2018.
//  Copyright © 2018 DevSouls. All rights reserved.
//

import Foundation

struct ImageData: Codable {
	var path: String = ""
	var imageExtension: String = ""
	
	enum CodingKeys: String, CodingKey
	{
		case path
		case imageExtension = "extension"
	}
}
