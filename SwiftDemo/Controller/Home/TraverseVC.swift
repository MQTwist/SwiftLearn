//
//  KeyWordVC.swift
//  SwiftDemo
//
//  Created by MQTwist on 2022/3/8.
//

import UIKit

class TraverseVC: BaseVC {
    var arr: [Int] = []

    override func viewDidLoad() {
        super.viewDidLoad()
        for item in 0..<5 {
            arr.append(item)
        }
        
        testMax()
        testMap()
        testFilter()
        testReduce()
        testFlatMapAndMap()
        testCompactMapAndMap()
        testUseLazyOrNo()
    }
    
    func testMax() {
        let max = arr.max()
        if nil != max {
            print(max!)
        } else {
            print("没有最大值")
        }
        
    }
    
    
    /// map方法可遍历整个数组，并对数组个每个元素进行操作，返回处理后的数组
    /// 主要是对元素操作
    func testMap() {
        let arr1 = arr.map { item in
            return item * 2
        }
        print(">>>map:\(arr1)")
    }
    
    
    /// filter方法可遍历整个数组，并依据设置的条件，对数组筛选并返回新的数组
    /// 主要是筛选
    func testFilter() {
        let arr1 = arr.filter { item in
            return item > 5
        }
        print(">>>filter:\(arr1)")
    }
    
    func testReduce() {
        let arr1 = arr.reduce(0) { (result, temp) in
            return result + temp
        }
        print(">>>reduce:\(arr1)")
    }
    
    func testFlatMapAndMap() {
        let temp = [[1, 2, 3], [4, 5, 6], [7, 8, 9]]
        //输出源数据格式一样的
        let arr1 = temp.map {$0}
        print(">>>map:\(arr1)")
        //会合并成一个
        let arr2 = temp.flatMap {$0}
        print(">>>flatMap:\(arr2)")
    }
    
    func testCompactMapAndMap() {
        let temp = ["123", "d", "s", "234"]
        //不会解包，失败就设置为nil
        let arr1 = temp.map { Int($0) }
        print(">>>map:\(arr1)")
        //会解包，失败就移除
        let arr2 = temp.compactMap { Int($0) }
        print(">>>compactMap:\(arr2)")
    }
    
    func testUseLazyOrNo() {
        //普通的map会直接执行完成
        let arr1 = arr.map { item -> Int in
            print(">>>map no lazy:\(item)")
            return item * 2
        }
        print(">>>result:\(arr1[0])")
        print(">>>result:\(arr1[1])")
        
        //添加lazy的map会在使用的时候执行，适合数据大的数组
        let arr2 = arr.lazy.map { item -> Int in
            print(">>>map lazy:\(item)")
            return item * 2
        }
        print(">>>result:\(arr2[0])")
        print(">>>result:\(arr2[1])")
        print(">>>result:\(arr2[4])")
    }
}
