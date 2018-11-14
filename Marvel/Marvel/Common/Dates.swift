//
//  Dates.swift
//  Marvel
//
//  Created by Víctor Vicente on 11/11/2018.
//  Copyright © 2018 DevSouls. All rights reserved.
//

import Foundation

extension Date {
	func toMilliseconds() -> Int64! {
		return Int64(self.timeIntervalSince1970 * 1000)
	}
}
