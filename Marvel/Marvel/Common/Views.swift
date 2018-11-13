//
//  Views.swift
//  Marvel
//
//  Created by Víctor Vicente on 11/11/2018.
//  Copyright © 2018 DevSouls. All rights reserved.
//

import Foundation
import UIKit

extension UIView {
	
	class func identifier() -> String {
		return String(describing: self)
	}
	
	class func nib() -> UINib {
		return UINib(nibName: self.identifier(), bundle: nil)
	}
}
