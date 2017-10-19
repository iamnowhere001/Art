//
//  TabBarViewController.swift
//  Art
//
//  Created by iamnowhere on 2017/10/18.
//  Copyright © 2017年 Jerrisoft. All rights reserved.
//

import UIKit

class TabBarViewController: UITabBarController {

    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
        
        self.setUpViewController(viewController: HomeViewController(), image: UIImage(named: "tabbar_home")!.withRenderingMode(UIImageRenderingMode.alwaysOriginal), selectedImage: UIImage(named: "tabbar_homeHL")!.withRenderingMode(UIImageRenderingMode.alwaysOriginal), title: "首页")
        
        self.setUpViewController(viewController: DiscoveryViewController(), image: UIImage(named: "tabbar_search")!, selectedImage: UIImage(named: "tabbar_searchHL")!, title: "发现")
        
        self.setUpViewController(viewController: MessageViewController(), image: UIImage(named: "tabbar_news")!, selectedImage: UIImage(named: "tabbar_newsHL")!, title: "示例") // 消息
        
        self.setUpViewController(viewController: MyselfViewController(), image: UIImage(named: "tabbar_myself")!, selectedImage: UIImage(named: "tabbar_myselfHL")!, title: "我的")
        
    }
    
    private func setUpViewController(viewController: UIViewController, image: UIImage, selectedImage: UIImage, title: String) {
        let nav = UINavigationController(rootViewController: viewController)
        
        // 图片显示原始颜色
        nav.tabBarItem = UITabBarItem(title: title, image: image, selectedImage: selectedImage)
        
        self.addChildViewController(nav)
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destinationViewController.
        // Pass the selected object to the new view controller.
    }
    */

}
