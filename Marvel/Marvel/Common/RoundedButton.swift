//
//  RoundedButton.swift
//  Marvel
//
//  Created by Víctor Vicente on 13/11/2018.
//  Copyright © 2018 DevSouls. All rights reserved.
//

import Foundation
import UIKit

class RoundedButton: UIButton {
	
	init() {
		super.init(frame: .zero)
		setup()
	}
	
	required init?(coder aDecoder: NSCoder) {
		fatalError("init(coder:) has not been implemented")
	}
	
	private func setup() {
		setTitleColor(.white, for: .normal)
		setTitleColor(UIColor.midnightBlue(), for: .highlighted)
		setTitleColor(UIColor.midnightBlue(), for: .selected)
		
		setBackgroundImage(UIImage(color: UIColor.midnightBlue()), for: .normal)
		setBackgroundImage(UIImage(color: UIColor.white), for: .highlighted)
		setBackgroundImage(UIImage(color: UIColor.white), for: .selected)
	}
	
	override func layoutSubviews() {
		super.layoutSubviews()
		layer.cornerRadius = frame.height / 2
		layer.borderWidth = 1
		layer.masksToBounds = true
	}
}
