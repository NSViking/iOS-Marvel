//
//  ComicMapper.swift
//  Marvel
//
//  Created by Víctor Vicente on 11/11/2018.
//  Copyright © 2018 DevSouls. All rights reserved.
//

import Foundation

class ComicMapper {
	
	class func mapComicToComicViewModel(comic: Comic) -> ComicViewModel {
		let comicViewModel = ComicViewModel(comicId: comic.id,
											title: comic.title,
											image: comic.thumbnailUrl)
		
		return comicViewModel
	}
	
	class func mapComicDataToComic(comicData: ComicData) -> Comic {
		
		let imagesMapped = comicData.images.map({ imageData -> String in
			return imageData.path + imageData.imageExtension
		})
		
		let thumbnailMapped = comicData.thumbnail.map({ imageData -> String in
			return imageData.path + imageData.imageExtension
		}) ?? ""
		
		let comic = Comic(id: comicData.id ?? 0,
						  title: comicData.title ?? "",
						  description: comicData.description ?? "",
						  format: comicData.format ?? "",
						  imagesUrls: imagesMapped,
						  thumbnailUrl: thumbnailMapped)
		return comic
	}
}
