//
//  Fonts.swift
//  Marvel
//
//  Created by Víctor Vicente on 11/11/2018.
//  Copyright © 2018 DevSouls. All rights reserved.
//

import Foundation
import UIKit

extension UIFont {
	
	static func bold(size: CGFloat) -> UIFont {
		return UIFont.boldSystemFont(ofSize: size)
	}
	
	static func regular(size: CGFloat) -> UIFont {
		return UIFont.systemFont(ofSize: size)
	}
}
