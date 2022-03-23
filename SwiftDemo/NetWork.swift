//
//  NetWork.swift
//  SwiftDemo
//
//  Created by 3ttyy on 2022/3/1.
//

import UIKit
import Alamofire

typealias Success = (code: Int, data: Any)

class NetWork: NSObject {
    static let shared = NetWork()
    
    private override init() {
        
    }
    
    override class func copy() -> Any {
        return self
    }
    
    override func mutableCopy() -> Any {
        return self
    }

    
}
