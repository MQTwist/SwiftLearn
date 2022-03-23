//
//  PostList.swift
//  SwiftDemo
//
//  Created by 3ttyy on 2022/3/2.
//

import UIKit
import HandyJSON

struct PostList: HandyJSON {
    var list: [Post]?
}

struct Post: HandyJSON {
    
    let id: String = ""
    let avatar: String = ""
    let vip: Bool = false
}
