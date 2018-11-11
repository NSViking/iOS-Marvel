//
//  HomeCollectionViewCell.swift
//  Marvel
//
//  Created by Víctor Vicente on 11/11/2018.
//  Copyright © 2018 DevSouls. All rights reserved.
//

import Foundation
import AlamofireImage
import UIKit

class HomeCollectionViewCell: UICollectionViewCell {
	
	var containerView = UIView()
	var comicImageView = UIImageView()
	var comicTitleLabel = UILabel()

	override init(frame: CGRect) {
		super.init(frame: frame)
		setupUI()
	}
	
	required init?(coder aDecoder: NSCoder) {
		super.init(coder: aDecoder)
	}
	
	override func prepareForReuse() {
		super.prepareForReuse()
		comicImageView.image = nil
	}
	
	func configure(title: String, imageUrl: String) {
		
		comicTitleLabel.text = title
		
		if let url = URL(string: imageUrl) {
			comicImageView.af_setImage(withURL: url,
									   imageTransition: .crossDissolve(0.2))
		}
	}
}
