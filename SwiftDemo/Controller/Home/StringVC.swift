//
//  StringVC.swift
//  SwiftDemo
//
//  Created by MQTwist on 2022/3/14.
//

import UIKit

class StringVC: BaseVC {

    override func viewDidLoad() {
        super.viewDidLoad()

        let str = "fsdfsfsgg"
        print(">>>\(testStr(str))")
    }
    
    func testStr(_ s: String) -> Int {
        guard s.count > 0 else { return -1 }
        var arr = [Int](repeating: 0, count: 26)
        for sca in s.unicodeScalars {
            arr[Int(sca.value) - 97] += 1
        }
        for (index, num) in arr.enumerated() {
            if num == 1 {
                return index
            }
        }
        return -1
    }
    
}
