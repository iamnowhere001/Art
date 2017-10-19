//
//  MessageViewController.swift
//  Art
//
//  Created by iamnowhere on 2017/10/12.
//  Copyright © 2017年 Jerrisoft. All rights reserved.
//

import UIKit

import SnapKit

class MessageViewController: UIViewController {
    
    private let tableView: UITableView = {
        let view = UITableView(frame: .zero, style: .plain)
        view.register(BaseCell.self, forCellReuseIdentifier: BaseCell.identifier)
        view.rowHeight = 50
        return view
    }()

    override func viewDidLoad() {
        super.viewDidLoad()

        navigationItem.title = "Demo"
    
        tableView.delegate = self
        tableView.dataSource = self
        view.addSubview(tableView)
        
        tableView.snp.makeConstraints { (make) in
            make.top.left.bottom.right.equalTo(view)
        }
    }
}

extension MessageViewController: UITableViewDataSource {
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return 20
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        var cell = UITableViewCell()
        
        cell = tableView.dequeueReusableCell(withIdentifier: BaseCell.identifier, for: indexPath)
        cell.imageView?.image = UIImage(named: "icon_nav_set")
        cell.detailTextLabel?.text = "\(indexPath.row)"
        
        if indexPath.row == 0 {
            cell.textLabel?.text = "🤡🤡 show girl"
        } else if indexPath.row == 1 {
            cell.textLabel?.text = "🤠🤠 shop list"
        } else {
            cell.textLabel?.text = "😄😄 \(indexPath)"
        }
        return cell
    }
    
}

extension MessageViewController: UITableViewDelegate {
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        tableView.deselectRow(at: indexPath, animated: true)
        
        if indexPath.row == 0 {
            let VC = GirlViewController()
            navigationController?.pushViewController(VC, animated: true)
        }
        
        if indexPath.row == 1 {
            let VC = ShopViewController()
            navigationController?.pushViewController(VC, animated: true)
        }
        
    }
}
