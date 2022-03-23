//
//  AlamofireVC.swift
//  SwiftDemo
//
//  Created by 3ttyy on 2022/3/2.
//

import UIKit
import Alamofire
import HandyJSON

class AlamofireVC: BaseVC {

    override func viewDidLoad() {
        super.viewDidLoad()
        postData()
        testHandyJson()
    }
    
    func postData() {
        let url = "https://github.com/xiaoyouxinqing/PostDemo/raw/master/PostDemo/Resources/PostListData_recommend_1.json"
        
        AF.request(url).responseData { response in
            switch response.result {
                case let .success(data):
                    let jsonString = String(data: data, encoding: .utf8)
                    guard let list = JSONDeserializer<PostList>.deserializeFrom(json: jsonString, designatedPath: nil) else {
                        print("can not convert to PostList")
                        return
                    }
                    print("succ>>>\(list.list?[0].avatar ?? "")")
                case let .failure(error):
                    print("fail>>>\(error)")
            }
        }
    }
    
    func testHandyJson() {
        let jsonString = "{\"doubleOptional\":1.1,\"stringImplicitlyUnwrapped\":\"hello\",\"int\":1}"
        if let obj = BasicTypes.deserialize(from: jsonString, designatedPath: nil) {
            print(obj.doubleOptional ?? 0)
        }
    }

}


class BasicTypes: HandyJSON {
    var int: Int = 2
    var doubleOptional: String?
 
    required init() {}
}
