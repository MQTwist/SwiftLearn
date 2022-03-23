//
//  FuncVC.swift
//  SwiftDemo
//
//  Created by MQTwist on 2022/3/8.
//

import UIKit

class FuncVC: BaseVC {

    override func viewDidLoad() {
        super.viewDidLoad()
        test(name: "mq", age: 20, gender: true)
        test(name: "mq")
        test(name: "mq", age: 21)
    }
    
    private func test(name: String, age: Int = 18, gender: Bool = false) {
        print(">>>name:\(name), age:\(String(describing: age)) gender:\(String(describing: gender))")
    }

}
