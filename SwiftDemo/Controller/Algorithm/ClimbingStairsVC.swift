//
//  ClimbingStairsVC.swift
//  SwiftDemo
//
//  Created by MQTwist on 2022/3/10.
//

/*
 * 你正在爬楼梯。它需要n步才能到达顶点。
 每次你都可以爬1级或2级台阶。有多少种不同的方法可以让你爬到顶峰?
 注:给定n将是一个正整数。
 
 example
 输入:2
 输出:2
 解释:有两种方法可以爬到顶端。
 1. 1步+ 1步
 2. 2步
 
 =========
 
 输入:3
 输出:3
 解释:有三种方法可以爬到顶端。
 1. 1步+ 1步+ 1步
 2. 1步+ 2步
 3. 2步+ 1步
 
 */

import UIKit

class ClimbingStairsVC: BaseVC {

    override func viewDidLoad() {
        super.viewDidLoad()
        print(">>>dongtaiguihua:\(testDongTaiGuiHua(num: 5))")
    }
    
    /* 动态规划 **/
    func testDongTaiGuiHua(num: Int) -> Int {
        guard num > 1 else {
            return 1
        }
        var arr = [Int].init(repeating: 0, count: num + 1)
        arr[1] = 1
        arr[2] = 2
        for i in 3...num {
            arr[i] = arr[i - 1] + arr[i - 2]
        }
        return arr[num]
    }

}
