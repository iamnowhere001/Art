//
//  HomeViewController.swift
//  Art
//
//  Created by iamnowhere on 2017/10/12.
//  Copyright © 2017年 Jerrisoft. All rights reserved.
//

import UIKit
import AVFoundation

import SnapKit

private let CellIdentifier = "XYCell"

class HomeViewController: UIViewController {
    
    var photos = Photo.allPhotos()
    
    override var preferredStatusBarStyle : UIStatusBarStyle {
        return UIStatusBarStyle.lightContent
    }

    private let collectionView: UICollectionView = {
        
        let layout = UICollectionViewLayout()
        
        let view = UICollectionView(frame: .zero, collectionViewLayout: layout)
        //view.register(ProductCell.self, forCellWithReuseIdentifier: CellIdentifier)
        view.register(UINib.init(nibName: "AnnotatedPhotoCell", bundle: nil), forCellWithReuseIdentifier: CellIdentifier)
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
        navigationItem.title = "档案酷";

        if let layout = collectionView.collectionViewLayout as? PinterestLayout {
            layout.delegate = self
        }
        
        collectionView.dataSource = self
        collectionView.delegate = self
        view.addSubview(collectionView)
        
        collectionView.snp.makeConstraints { (make) in
            make.top.left.bottom.right.equalTo(view)
        }
    }

    
}

extension HomeViewController: UICollectionViewDataSource, UICollectionViewDelegate {
    
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return photos.count
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: CellIdentifier, for: indexPath) as! AnnotatedPhotoCell
        cell.photo = photos[(indexPath as NSIndexPath).item]
        return cell
    }
    
    // MARK: UICollectionViewDelegate
    func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
        
        let VC = TestTableViewController()
        self.navigationController?.pushViewController(VC, animated: true)
    }
}

extension HomeViewController : PinterestLayoutDelegate {
    func collectionView(_ collectionView:UICollectionView, heightForPhotoAtIndexPath indexPath: IndexPath,
                        withWidth width: CGFloat) -> CGFloat {
        let photo = photos[(indexPath as NSIndexPath).item]
        let boundingRect =  CGRect(x: 0, y: 0, width: width, height: CGFloat(MAXFLOAT))
        let rect  = AVMakeRect(aspectRatio: photo.image.size, insideRect: boundingRect)
        return rect.size.height
    }
    
    func collectionView(_ collectionView: UICollectionView,
                        heightForAnnotationAtIndexPath indexPath: IndexPath, withWidth width: CGFloat) -> CGFloat {
        let annotationPadding = CGFloat(4)
        let annotationHeaderHeight = CGFloat(17)
        let photo = photos[(indexPath as NSIndexPath).item]
        let font = UIFont(name: "AvenirNext-Regular", size: 10)!
        let commentHeight = photo.heightForComment(font, width: width)
        let height = annotationPadding + annotationHeaderHeight + commentHeight + annotationPadding
        return height
    }
}

