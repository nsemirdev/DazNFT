//
//  AccountVC.swift
//  DazNFT
//
//  Created by Emir Alkal on 29.12.2022.
//

import UIKit

class AccountVC: DNViewController {

    static let cellId = "AccountCell"
    let tableView: UITableView = {
        let tableView = UITableView()
        tableView.separatorStyle = .none
        tableView.backgroundColor = .clear
        tableView.register(UITableViewCell.self, forCellReuseIdentifier: cellId)
        tableView.backgroundColor = .clear
        tableView.rowHeight = 62
        return tableView
    }()
    
    let data = [
        (imageName: "Group 116", "Profile Settings"),
        (imageName: "Group 105", "My Collections"),
        (imageName: "Group 106", "Privacy Policy"),
        (imageName: "Frame 300", "Help Center"),
        (imageName: "Group 150", "Preferences"),
        (imageName: "Frame 312", "Log out"),
    ]
    
    override func viewDidLoad() {
        super.viewDidLoad()
        tableView.dataSource = self
        tableView.delegate = self
        view.addSubview(tableView)
        navigationItem.title = "Account Settings"
    }
    
    override func viewDidLayoutSubviews() {
        super.viewDidLayoutSubviews()
        tableView.frame = view.bounds
    }
}

extension AccountVC: UITableViewDelegate, UITableViewDataSource {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        data.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: AccountVC.cellId, for: indexPath)
        cell.imageView?.image = UIImage(named: data[indexPath.row].imageName)
        cell.textLabel?.text = data[indexPath.row].1
        cell.backgroundColor = .clear
        cell.accessoryType = .disclosureIndicator
        return cell
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        tableView.deselectRow(at: indexPath, animated: true)
    }
    
}
