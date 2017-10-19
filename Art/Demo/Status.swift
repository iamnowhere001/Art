//
//  Status.swift
//  Art
//
//  Created by iamnowhere on 2017/10/17.
//  Copyright © 2017年 Jerrisoft. All rights reserved.
//

import Foundation

struct Status {
    var Id = 0
    var profileImageUrl:String!
    var userName:String!
    var mbtype:String!
    var createdAt:String!
    var source:String!
    var text:String!
    
    init(dic:Dictionary<String,Any>) {
        self.Id = dic["Id"] as! Int
        self.profileImageUrl = dic["profileImageUrl"] as! String
        self.userName = dic["userName"] as! String
        self.mbtype = dic["mbtype"] as! String
        self.createdAt = dic["createdAt"] as! String
        self.source = dic["source"] as! String
        self.text = dic["text"] as! String
    }
    
}
