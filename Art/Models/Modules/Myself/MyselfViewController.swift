//
//  MyselfViewController.swift
//  Art
//
//  Created by iamnowhere on 2017/10/12.
//  Copyright © 2017年 Jerrisoft. All rights reserved.
//

import UIKit

class MyselfViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()

        navigationItem.title = "个人主页"
        
        navigationItem.leftBarButtonItem = UIBarButtonItem(barButtonSystemItem: UIBarButtonSystemItem.done, target: self, action: nil)
        
        var image = UIImage(named: "icon_nav_add_new")
        image = image?.withRenderingMode(UIImageRenderingMode.alwaysOriginal)
        
        //navigationItem.rightBarButtonItem = UIBarButtonItem(image: image, style: UIBarButtonItemStyle.plain, target: self, action: #selector(MyselfViewController.goSetting))
        
        let logButton : UIBarButtonItem = UIBarButtonItem(title: "设置", style: UIBarButtonItemStyle.plain, target: self, action: #selector(MyselfViewController.goSetting))
        navigationItem.rightBarButtonItem = logButton;
        
    }
    
    @objc private func goSetting() {
        let VC = SettingViewController()
        self.navigationController?.pushViewController(VC, animated: true)
    }
    
    @objc func callMe() {
       print("12313")
    }
    
//    let timer = Timer.scheduledTimer(timeInterval: 1, target: self,
//    selector:#selector(callMe), userInfo: nil, repeats: true)
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }

}
