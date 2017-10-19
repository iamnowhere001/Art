//
//  Person.swift
//  Art
//
//  Created by iamnowhere on 2017/10/19.
//  Copyright © 2017年 Jerrisoft. All rights reserved.
//

import UIKit

/**
 在swift中如果要获取一个方法的selector用#selector()实现。我们也知道OC中的属性其实是自动生成了getter和setter方法。
 swift 3中支持获取属性的getter和setter方法。语法就是：#selector(getter: keypath ) 和 #selector(setter: keypath )。
 */

class Person: NSObject {
    @objc dynamic var firstName: String
    @objc dynamic let lastName: String
    @objc dynamic var fullName: String {
        return "\(firstName) \(lastName)"
    }
    
    init(firstName: String, lastName: String) {
        self.firstName = firstName
        self.lastName = lastName
    }
}

// #selector获取属性的getter和setter方法
let firstNameGetter = #selector(getter: Person.firstName)
let firstNameSetter = #selector(setter: Person.firstName)



