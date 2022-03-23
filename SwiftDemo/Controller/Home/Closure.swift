//
//  Closure.swift
//  SwiftDemo
//
//  Created by 3ttyy on 2022/3/1.
//

import UIKit
import MapKit


typealias MQClosure = () -> ()

class Closure: BaseVC {
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        let nums = [1, 4, 3, 2]
        
        let num1 = nums.sorted(by: { num1, num2 in
            return num1 > num2
        })
        print(num1)
        
        testNotEscape {
            print("非逃逸")
        }
        testEscape {
            print("逃逸")
        }
        huidiao()
    }
    
    func testNotEscape(callback: MQClosure) {
        print(1)
        callback()
        print(2)
    }
    
    func testEscape(callback: @escaping MQClosure) {
        print()
        print(1)
        DispatchQueue.main.asyncAfter(deadline: .now() + 1) {
            callback()
        }
        print(2)
    }
    
    func huidiao() {
        let clo = Closure1()
        clo.closure = {
            print(">>>huidiao")
        }
    }
}

class Closure1: NSObject {
    var closure: MQClosure?
    
    override init() {
        super.init()
        testClo()
    }
    
    func testClo() {
        DispatchQueue.main.asyncAfter(deadline: .now() + 3) {
            guard let closure = self.closure else {
                return
            }
            print(">>>testClo")
            closure()
        }
    }
}
