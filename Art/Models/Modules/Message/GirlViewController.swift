//
//  GirlViewController.swift
//  Art
//
//  Created by iamnowhere on 2017/10/19.
//  Copyright © 2017年 Jerrisoft. All rights reserved.
//

import UIKit

import SnapKit

private let CellIdentifier = "XYCell"
class GirlViewController: UIViewController {

    private let tableView: UITableView = {
        let view = UITableView(frame: .zero, style: .plain)
        view.register(StatusCell.self, forCellReuseIdentifier: CellIdentifier)
        view.estimatedRowHeight = 100.0
        view.rowHeight = UITableViewAutomaticDimension
        return view
    }()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = UIColor.gray
        title = "girl"
        
        tableView.delegate = self
        tableView.dataSource = self
        view.addSubview(tableView)
        
        tableView.snp.makeConstraints { (make) in
            make.top.left.bottom.right.equalTo(view)
        }
        
        loadData()

        // Do any additional setup after loading the view.
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

extension GirlViewController: UITableViewDataSource, UITableViewDelegate {
     func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return self.data.count
    }
    
     func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: CellIdentifier, for: indexPath) as! StatusCell
        cell.status = self.data[indexPath.row]
        return cell
    }
    
     func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        tableView.deselectRow(at: indexPath, animated: true)
        

    }
}


