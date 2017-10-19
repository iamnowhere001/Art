//
//  StatusCell.swift
//  Art
//
//  Created by iamnowhere on 2017/10/17.
//  Copyright © 2017年 Jerrisoft. All rights reserved.
//

import UIKit
import SnapKit

class StatusCell: UITableViewCell {

    // MARK: - public 公共属性
    var status:Status! {
        didSet {
            self.avatarImageView.image = UIImage(named: status.profileImageUrl)
            self.mtypeImageView.image = UIImage(named: status.mbtype)
            self.userNameLabel.text = status.userName
            self.createdAtLabel.text = status.createdAt
            self.sourceLabel.text = status.source
            self.contentLabel.text = status.text
        }
    }
    
    // MARK: - life cycle
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }
    
    override init(style: UITableViewCellStyle, reuseIdentifier: String?) {
        super.init(style: style, reuseIdentifier: reuseIdentifier)
        self.setUp()
    }
    
    required init?(coder aDecoder: NSCoder) {
        super.init(coder: aDecoder)
    }
    
    // MARK: -
    private func setUp() {
        self.contentView.addSubview(self.avatarImageView)
        self.contentView.addSubview(self.userNameLabel)
        self.contentView.addSubview(self.mtypeImageView)
        self.contentView.addSubview(self.createdAtLabel)
        self.contentView.addSubview(self.sourceLabel)
        self.contentView.addSubview(self.contentLabel)
        
        // layout
        self.avatarImageView.snp.makeConstraints { (make) in
            make.top.left.equalTo(10.0)
            make.size.equalTo(CGSize(width: 40.0, height: 40.0))
        }
        
        self.userNameLabel.snp.makeConstraints { (make) in
            make.top.equalTo(self.avatarImageView.snp.top)
            make.left.equalTo(self.avatarImageView.snp.right).offset(8.0)
        }
        
        self.mtypeImageView.snp.makeConstraints { (make) in
            make.top.equalTo(self.userNameLabel.snp.top)
            make.left.equalTo(self.userNameLabel.snp.right).offset(8.0)
            make.size.equalTo(CGSize(width: 14.0, height: 14.0))
        }
        
        self.createdAtLabel.snp.makeConstraints { (make) in
            make.left.equalTo(self.userNameLabel.snp.left)
            make.bottom.equalTo(self.avatarImageView.snp.bottom)
        }
        
        self.sourceLabel.snp.makeConstraints { (make) in
            make.left.equalTo(self.createdAtLabel.snp.right).offset(10.0)
            make.bottom.equalTo(self.createdAtLabel.snp.bottom)
            make.right.lessThanOrEqualTo(-8.0)
        }
        
        self.contentLabel.snp.makeConstraints { (make) in
            make.top.equalTo(self.avatarImageView.snp.bottom).offset(8.0)
            make.left.equalTo(self.avatarImageView.snp.left)
            make.right.equalTo(-8.0)
            make.bottom.equalTo(-10.0) // 注意此处必须设置，否则contentView无法自适应高度
        }
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }
    
    
    // MARK: - 私有属性
    private lazy var avatarImageView:UIImageView = {
        let temp = UIImageView()
        return temp
    }()
    
    private lazy var mtypeImageView:UIImageView = {
        let temp = UIImageView()
        return temp
    }()
    
    private lazy var userNameLabel:UILabel = {
        let temp = UILabel()
        temp.textColor = UIColor(red: 50.0/255.0, green: 50.0/255.0, blue: 50.0/255.0, alpha: 1.0)
        temp.font = UIFont.systemFont(ofSize: 14.0)
        return temp
    }()
    
    private lazy var createdAtLabel:UILabel = {
        let temp = UILabel()
        temp.textColor = UIColor(red: 120.0/255.0, green: 120.0/255.0, blue: 120.0/255.0, alpha: 1.0)
        temp.font = UIFont.systemFont(ofSize: 12.0)
        return temp
    }()
    
    private lazy var sourceLabel:UILabel = {
        let temp = UILabel()
        temp.textColor = UIColor(red: 120.0/255.0, green: 120.0/255.0, blue: 120.0/255.0, alpha: 1.0)
        temp.font = UIFont.systemFont(ofSize: 12.0)
        return temp
    }()
    
    private lazy var contentLabel:UILabel = {
        let temp = UILabel()
        temp.textColor = UIColor(red: 50.0/255.0, green: 50.0/255.0, blue: 50.0/255.0, alpha: 1.0)
        temp.font = UIFont.systemFont(ofSize: 14.0)
        temp.numberOfLines = 0
        return temp
    }()

}
