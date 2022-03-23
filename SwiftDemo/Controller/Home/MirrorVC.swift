//
//  MirrorVC.swift
//  SwiftDemo
//
//  Created by 3ttyy on 2022/3/4.
//

import UIKit

class MirrorVC: BaseVC {

    override func viewDidLoad() {
        super.viewDidLoad()
        testMirror()
        testToJson()
    }
    
    func testMirror() {
        let p = Son()
        let mirror = Mirror(reflecting: p.self)
        print("对象类型：\(mirror.subjectType)")
        print("对象类型：\(mirror.children.count)")
        
        for child in mirror.children {
            print("\(child.label ?? "")----\(child.value)")
        }
        
        let mirrorDic = mapDic(mirror: mirror)
        print(mirrorDic)
    }
    
    func testToJson() {
        let p = Person()
        do {
            print(try p.toJson()!)
        } catch {
            print(error.localizedDescription)
            print((error as? JsonMapperError)?.errorCode as Any)
        }
    }
    
    func mapDic(mirror: Mirror) -> [String: Any] {
        var dic: [String: Any] = [:]
        for child in mirror.children {
            guard let label = child.label else {
                continue
            }
            let propertyMirror = Mirror(reflecting: child.value)
            print(propertyMirror)
            dic[label] = child.value
        }
        guard let superMirror = mirror.superclassMirror else {
            return dic
        }
        let superDic = mapDic(mirror: superMirror)
        for p in superDic {
            dic[p.key] = p.value
        }
        return dic
    }

}

protocol CustomJsonProtocol {
    func toJson() throws -> Any?
}

enum JsonMapperError {
    case Emptykey
    case NotConformProtocol
}

extension JsonMapperError: LocalizedError {
    var errorDescription: String? {
        switch self {
            case .Emptykey:
                return "key 为空"
            case .NotConformProtocol:
                return "没有遵循协议"
        }
    }
}

extension JsonMapperError: CustomNSError {
    var errorCode: Int {
        switch self {
            case .Emptykey:
                return 100
            case .NotConformProtocol:
                return 101
        }
    }
    
}

extension CustomJsonProtocol {
    func toJson() throws -> Any? {
        let mirror = Mirror(reflecting: self)
        guard !mirror.children.isEmpty else {
            return self
        }
        var result: [String: Any] = [:]
        for childern in mirror.children {
            guard let value = childern.value as? CustomJsonProtocol else {
                throw JsonMapperError.NotConformProtocol
            }
            guard let key = childern.label else {
                throw JsonMapperError.Emptykey
            }
            print(key)
            result[key] = try value.toJson()
        }
        return result
    }
}

extension Optional: CustomJsonProtocol {
    func toJson() throws -> Any? {
        if let x = self {
            if let value = x as? CustomJsonProtocol {
                return try value.toJson()
            }
            throw JsonMapperError.NotConformProtocol
        }
        return nil
    }
}

class Person {
    var name: String = "ming"
    var age: Int = 18
    var height = 1.85
}

extension Person: CustomJsonProtocol {}
extension String: CustomJsonProtocol {}
extension Int: CustomJsonProtocol {}
extension Bool: CustomJsonProtocol {}
extension Double: CustomJsonProtocol {}
extension Float: CustomJsonProtocol {}


class Son: Person {
    var weight = 20
}



