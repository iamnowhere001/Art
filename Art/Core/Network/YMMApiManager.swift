//
//  YMMApiManager.swift
//  Art
//
//  Created by iamnowhere on 2017/10/13.
//  Copyright © 2017年 Jerrisoft. All rights reserved.
//

import UIKit

import Alamofire

class YMMApiManager: NSObject {

    
    private func testApi() {
        
        Alamofire.request("https://api.500px.com/v1/photos", method: .get).responseJSON {
            response in
            guard let JSON = response.result.value else { return }
            print("JSON: \(JSON)")
        }
        
        // Get
        Alamofire.request("http://archives-interface.ymm.cn/api/opc/10003").responseJSON { (response) in
            print(response.request ?? "http://archives-interface.ymm.cn/api/opc/10003")  // original URL request
            print(response.response ?? "http://archives-interface.ymm.cn/api/opc/10003") // HTTP URL response
            print(response.data as Any)     // server data
            print(response.result)   // result of response serialization
            
            if let JSON = response.result.value {
                print("JSON: \(JSON)")
            }
            
        }
        
        Alamofire.request("http://archives-interface.ymm.cn/api/opc/10007").responseJSON { (response) in
            if let JSON = response.result.value {
                print("JSON2: \(JSON)")
            }
        }
        
        // 上传文件
        let fileURL = Bundle.main.url(forResource: "Default", withExtension: "png")
        Alamofire.upload(fileURL!, to: "https://httpbin.org/pos")
    }
}
