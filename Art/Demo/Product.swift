//
//  Product.swift
//  UITableViewDemo
//
//  Created by Kenshin Cui on 2017/2/11.
//  Copyright © 2017年 CMJStudio. All rights reserved.
//

import Foundation

struct Product {
    var Id = 0
    var image:String!
    var name:String!
    var text:String!
    var price:Int = 0  // var price:Double = 0.0
    var sale:Int = 0
    
    init(dic:Dictionary<String,Any>) {
        self.Id = dic["Id"] as! Int
        self.image = dic["image"] as! String
        self.name = dic["name"] as! String
        self.text = dic["text"] as! String
        self.price = dic["price"] as! Int
        self.sale = dic["sale"] as! Int
    }
}
