//
//  ComicViewModel.swift
//  Marvel
//
//  Created by Víctor Vicente on 11/11/2018.
//  Copyright © 2018 DevSouls. All rights reserved.
//

import Foundation

struct ComicViewModel {
	
	var comicId: Int = 0
	var title: String = ""
	var image: String = ""
	var price: String = ""
	
	func isEmptyImage() -> Bool {
		if self.image.contains("image_not_available") || self.image == "" {
			return true
		}
		return false
	}
}
