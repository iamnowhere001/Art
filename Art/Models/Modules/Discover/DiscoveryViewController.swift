//
//  DiscoveryViewController.swift
//  Art
//
//  Created by iamnowhere on 2017/10/12.
//  Copyright © 2017年 Jerrisoft. All rights reserved.
//

import UIKit

class DiscoveryViewController: UIViewController { // , UITableViewDelegate, UITableViewDataSource
    
    var tableView: UITableView?
    var dataArray: NSMutableArray?

    override func viewDidLoad() {
        super.viewDidLoad()
        self.view.backgroundColor = UIColor.brown
        self.navigationItem.title = "发现"
        
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }

}

extension DiscoveryViewController {
    
   
    
}
