//
//  ShopViewController.swift
//  Art
//
//  Created by iamnowhere on 2017/10/19.
//  Copyright © 2017年 Jerrisoft. All rights reserved.
//

import UIKit
import SnapKit

private let CellIdentifier = "XYCell"

class ShopViewController: UIViewController {

    private let collectionView: UICollectionView = {
        let layout = UICollectionViewFlowLayout()
        layout.estimatedItemSize = CGSize(width: 150.0, height: 160.0)
        layout.minimumLineSpacing = 4.0
        layout.minimumInteritemSpacing = 4.0
        let view = UICollectionView(frame: .zero, collectionViewLayout: layout)
        view.register(ProductCell.self, forCellWithReuseIdentifier: CellIdentifier)
        view.contentInset = UIEdgeInsets(top: 8.0, left: 8.0, bottom: 8.0, right: 8.0)
        if #available(iOS 10.0, *) {
            view.backgroundColor = UIColor(displayP3Red: 239.0/255.0, green: 239.0/255.0, blue: 239.0/255.0, alpha: 1.0)
        } else {
            view.backgroundColor = UIColor(white: 0.98, alpha: 1.0);
        }
        return view
    }()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = UIColor.gray
        title = "购物"
        
        collectionView.dataSource = self
        collectionView.delegate = self
        view.addSubview(collectionView)
        
        collectionView.snp.makeConstraints { (make) in
            make.top.left.bottom.right.equalTo(view)
        }
        
        loadData()        
        
        // Do any additional setup after loading the view.
    }
    
    // MARK: - private method
    private func loadData() {
        guard let path = Bundle.main.path(forResource: "ProductInfo.plist", ofType: nil),let array = NSArray(contentsOfFile: path) else { return }
        
        for element in array {
            data.append(Product(dic:element as! [String : Any]))
        }
        collectionView.reloadData()
    }
    
    private var data = [Product]()

}

extension ShopViewController: UICollectionViewDataSource, UICollectionViewDelegate {
    
     func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return self.data.count
    }
    
     func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: CellIdentifier, for: indexPath) as! ProductCell
        cell.product = self.data[indexPath.item]
        return cell
    }
    
    // MARK: UICollectionViewDelegate
     func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
        
        let VC = TestTableViewController()
        self.navigationController?.pushViewController(VC, animated: true)
    }
}
