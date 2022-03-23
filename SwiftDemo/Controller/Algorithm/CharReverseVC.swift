//
//  CharReverseVC.swift
//  SwiftDemo
//
//  Created by MQTwist on 2022/3/10.
//

import UIKit

class CharReverseVC: BaseVC {

    override func viewDidLoad() {
        super.viewDidLoad()

        var arr: [Character] = ["A", "B", "C", "D", "E"]
        print(">>>输入\(arr)")
        print(">>>输出\(reverse(arr: &arr))")
    }
    
    //inout 指针传递
    func reverse(arr: inout [Character]) -> [Character] {
        guard arr.count > 0 else {
            return arr
        }
        var left = 0, right = arr.count - 1
        while left < right {
            let temp = arr[left]
            arr[left] = arr[right]
            arr[right] = temp
            left += 1
            right -= 1
        }
        return arr
    }
}
