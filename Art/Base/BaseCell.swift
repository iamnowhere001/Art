//
//  BaseCell.swift
//  Art
//
//  Created by iamnowhere on 2017/10/19.
//  Copyright © 2017年 Jerrisoft. All rights reserved.
//

import UIKit

class BaseCell: UITableViewCell {

   static let identifier = "BaseCell"
    
    override init(style: UITableViewCellStyle, reuseIdentifier: String?) {
        super.init(style: .value1, reuseIdentifier: reuseIdentifier)
        
        backgroundColor = .white
        textLabel?.textColor = UIColor.darkGray
        textLabel?.font = UIFont.systemFont(ofSize: 15.0)
        
        detailTextLabel?.font = UIFont.systemFont(ofSize: 12.0)
        detailTextLabel?.textColor = UIColor.lightGray
    }
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
}
