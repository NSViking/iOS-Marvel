//
//  Hash.swift
//  Marvel
//
//  Created by Víctor Vicente on 11/11/2018.
//  Copyright © 2018 DevSouls. All rights reserved.
//

import Foundation

class Hash {
	
	static func md5(string: String) -> Data {
		let messageData = string.data(using:.utf8)!
		var digestData = Data(count: Int(CC_MD5_DIGEST_LENGTH))
		
		_ = digestData.withUnsafeMutableBytes {digestBytes in
			messageData.withUnsafeBytes {messageBytes in
				CC_MD5(messageBytes, CC_LONG(messageData.count), digestBytes)
			}
		}
		
		return digestData
	}
}
