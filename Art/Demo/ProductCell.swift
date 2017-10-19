//
//  ProductCell.swift
//  UITableViewDemo
//
//  Created by Kenshin Cui on 2017/2/11.
//  Copyright © 2017年 CMJStudio. All rights reserved.
//

import UIKit

class ProductCell: UICollectionViewCell {
    
    // MARK: - 公共属性
    var product:Product! {
        didSet {
            self.productImageView.image = UIImage(named: product.image)
            self.contentLabel.text = product.text
            self.priceLabel.text = "¥\(product.price)"
            self.salesLabel.text = "\(product.sale)人购买"
        }
    }
    
    // MARK: - 生命周期及方法覆盖
    override init(frame: CGRect) {
        super.init(frame: frame)
        self.setup()
    }
    
    required init?(coder aDecoder: NSCoder) {
        super.init(coder: aDecoder)
    }
    
    override func preferredLayoutAttributesFitting(_ layoutAttributes: UICollectionViewLayoutAttributes) -> UICollectionViewLayoutAttributes {
        return super.preferredLayoutAttributesFitting(layoutAttributes)
    }
    
    // MARK: - 私有方法
    private func setup() {
        self.backgroundColor = UIColor.white
        self.contentView.addSubview(self.productImageView)
        self.contentView.addSubview(self.contentLabel)
        self.contentView.addSubview(self.priceLabel)
        self.contentView.addSubview(self.salesLabel)
        
        let screenWidth = UIScreen.main.bounds.width
        self.productImageView.snp.makeConstraints { (make) in
           // make.top.left.right.equalTo(0.0)
            make.top.left.equalTo(8)
            make.right.equalTo(-8)
            make.height.equalTo(screenWidth*0.5).priority(999)
            make.width.equalTo((screenWidth-20)*0.5-16).priority(999) // 此设置可以确定cell宽度,注意尽管降低了默认的优先级仅仅是为了计算中间步骤不至于约束冲突，最终显示时此约束仍然会生效   啊啊啊 -20 这个是写死的啦 8+8+4 = 20
        }
        
        self.contentLabel.snp.makeConstraints { (make) in
            make.top.equalTo(self.productImageView.snp.bottom).offset(4.0)
            make.left.equalTo(8.0)
            make.right.equalTo(-8.0)
            // Label 高度根据内容填充
        }
        
        self.priceLabel.snp.makeConstraints { (make) in
            make.top.equalTo(self.contentLabel.snp.bottom).offset(8.0)
            make.left.equalTo(self.contentLabel.snp.left)
            make.bottom.equalTo(-8.0) //此设置可以确定cell高度
        }
        
        self.salesLabel.snp.makeConstraints { (make) in
            make.centerY.equalTo(self.priceLabel.snp.centerY)
            make.right.equalTo(-8.0)
        }
    }
    
    // MARK: - 私有属性
    private lazy var productImageView:UIImageView = {
        let temp = UIImageView()
        temp.contentMode = .scaleAspectFit
        temp.clipsToBounds = true
        return temp
    }()
    
    private lazy var contentLabel:UILabel = {
        let temp = UILabel()
        temp.textColor = UIColor(red: 50.0/255.0, green: 50.0/255.0, blue: 50.0/255.0, alpha: 1.0)
        temp.font = UIFont.systemFont(ofSize: 12.0)
        temp.numberOfLines = 2 // 最多显示两行
        return temp
    }()
    
    private lazy var priceLabel:UILabel = {
        let temp = UILabel()
        temp.textColor = UIColor.orange
        temp.font = UIFont.systemFont(ofSize: 14.0)
        return temp
    }()
    
    private lazy var salesLabel:UILabel = {
        let temp = UILabel()
        temp.textColor = UIColor(red: 150.0/255.0, green: 150.0/255.0, blue: 150.0/255.0, alpha: 1.0)
        temp.font = UIFont.systemFont(ofSize: 12.0)
        return temp
    }()
    
}
