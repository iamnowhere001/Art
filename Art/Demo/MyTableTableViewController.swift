//
//  ViewController.swift
//  UITableViewDemo
//
//  Created by 崔江涛 on 2017/2/10.
//  Copyright © 2017年 CMJStudio. All rights reserved.
//

import UIKit

private let MyTableViewControllerCellIdentifier = "StatusCell"

class MyTableViewController: UITableViewController {
    
    // MARK: - 生命周期及覆盖方法、属性
    override func viewDidLoad() {
        super.viewDidLoad()
        self.setup()
        self.loadData()
    }
    
    // MARK: - 私有方法
    private func setup() {
        tableView.register(StatusCell.self, forCellReuseIdentifier: MyTableViewControllerCellIdentifier)
        tableView.estimatedRowHeight = 100.0 // 必须设置，否则无法自动计算行高
        tableView.rowHeight = UITableViewAutomaticDimension // 可以不用 self.

    }
    
    private func loadData() {
        guard let path = Bundle.main.path(forResource: "StatusInfo.plist", ofType: nil),let array = NSArray(contentsOfFile: path) else { return }
        for element in array {
            data.append(Status(dic:element as! [String : Any]))
        }
        
        tableView.reloadData()
    }
    
    // MARK: - 私有属性
    fileprivate var data = [Status]()
}

extension MyTableViewController {
    
    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return self.data.count
    }
    
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: MyTableViewControllerCellIdentifier, for: indexPath) as! StatusCell
        cell.status = self.data[indexPath.row]
        return cell
    }
    
    override func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        tableView.deselectRow(at: indexPath, animated: true)
        
        let VC = TestTableViewController()
        self.navigationController?.pushViewController(VC, animated: true)
    }
    
}

