
//
//  MyCollectionViewController.swift
//  UITableViewDemo
//
//  Created by Kenshin Cui on 2017/2/11.
//  Copyright © 2017年 CMJStudio. All rights reserved.
//

import UIKit

private let MyCollectionViewControllerReuseIdentifier = "ProductCell"

class MyCollectionViewController: UICollectionViewController {

    // MARK: - life cycle
    override func viewDidLoad() {
        super.viewDidLoad()
        self.setUp()
        self.loadData()
    }

    // MARK: - private method
    private func setUp() {
        collectionView!.register(ProductCell.self, forCellWithReuseIdentifier: MyCollectionViewControllerReuseIdentifier)
        let layout = self.collectionView?.collectionViewLayout as? UICollectionViewFlowLayout
        layout?.estimatedItemSize = CGSize(width: 150.0, height: 160.0)
        layout?.minimumLineSpacing = 4.0
        layout?.minimumInteritemSpacing = 4.0 // default 10.0
        collectionView?.contentInset = UIEdgeInsets(top: 8.0, left: 8.0, bottom: 8.0, right: 8.0)
        
        if #available(iOS 10.0, *) {
            collectionView?.backgroundColor = UIColor(displayP3Red: 239.0/255.0, green: 239.0/255.0, blue: 239.0/255.0, alpha: 1.0)
        } else {
            // Fallback on earlier versions
            collectionView?.backgroundColor = UIColor(white: 0.98, alpha: 1.0);
        }
    }
    
    // MARK: - private method
    private func loadData() {
        guard let path = Bundle.main.path(forResource: "ProductInfo.plist", ofType: nil),let array = NSArray(contentsOfFile: path) else { return }
        for element in array {
            data.append(Product(dic:element as! [String : Any]))
        }
        collectionView?.reloadData()
    }

    private var data = [Product]()
}

extension MyCollectionViewController {
    
    // MARK: UICollectionViewDataSource
//    override func numberOfSections(in collectionView: UICollectionView) -> Int {
//        return 1
//    }
    
    override func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return self.data.count
    }
    
    override func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: MyCollectionViewControllerReuseIdentifier, for: indexPath) as! ProductCell
        cell.product = self.data[indexPath.item]
        return cell
    }
    
    // MARK: UICollectionViewDelegate
    override func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
        
        let VC = TestTableViewController()
        self.navigationController?.pushViewController(VC, animated: true)
    }
    
}
