//
//  User.swift
//  Art
//
//  Created by iamnowhere on 2017/10/12.
//  Copyright © 2017年 Jerrisoft. All rights reserved.
//

import UIKit

class User: NSObject {
    fileprivate var name = "private"
}

extension User {
    var accessPrivate: String {
        return name
    }
}
