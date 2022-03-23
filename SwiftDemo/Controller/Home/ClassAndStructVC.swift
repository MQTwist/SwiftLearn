//
//  ClassAndStructVC.swift
//  SwiftDemo
//
//  Created by 3ttyy on 2022/3/3.
//

import UIKit

class ClassAndStructVC: BaseVC {

    override func viewDidLoad() {
        super.viewDidLoad()
        testAnimal()
        testStruct()
    }
    
    func testAnimal() {
        let cat = Animal()
        cat.name = "Tom"
        cat.weight = 100
        let blackCat = cat
        blackCat.name = "blackcat"
        print("cat name: \(cat.name ?? "")")
        if blackCat === cat {
            print("identical")
        } else {
            print("not identical")
        }
        let redCat = Animal()
        redCat.weight = 100
        redCat.name = "blackcat"
        if redCat == cat {
            print("same")
        } else {
            print("not same")
        }
    }
    
    
    func testStruct() {
        var p1 = MQPoint(x: 10, y: 20)
        let p2 = p1
        
        if p1 == p2 {
            print("p same")
        } else {
            print("p not same")
        }
        
        p1.x = 14
        
        if p1 == p2 {
            print("p is same")
        } else {
            print("p is not same")
        }
        
        print("x:\(p1.x), y:\(p1.y)")
        print("x:\(p2.x), y:\(p2.y)")
    }
}



class Animal {
    var name: String?
    var weight = 0.0
}

extension Animal: Equatable {
    static func == (lhs: Animal, rhs: Animal) -> Bool {
        return lhs.name == rhs.name && lhs.weight == rhs.weight
    }
}

struct MQPoint: Equatable {
    var x = 0.0
    var y = 0.0
}
