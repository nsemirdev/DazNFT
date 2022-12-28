//
//  HomeVC.swift
//  DazNFT
//
//  Created by Emir Alkal on 28.12.2022.
//

import UIKit
import SnapKit

class HomeVC: DNViewController {
    let sellers = [
        SellerModel(index: 1, profileImageName: "seller1", name: "Emir", price: "$123.45", isFollowing: true),
        SellerModel(index: 2, profileImageName: "seller2", name: "Ozge", price: "$123.45", isFollowing: false),
        SellerModel(index: 3, profileImageName: "seller1", name: "Emir", price: "$123.45", isFollowing: true),
        SellerModel(index: 4, profileImageName: "seller2", name: "Ozge", price: "$123.45", isFollowing: false),
        SellerModel(index: 5, profileImageName: "seller1", name: "Emir", price: "$123.45", isFollowing: true),
        SellerModel(index: 6, profileImageName: "seller2", name: "Ozge", price: "$123.45", isFollowing: false),
        SellerModel(index: 7, profileImageName: "seller1", name: "Emir", price: "$123.45", isFollowing: true),
        SellerModel(index: 8, profileImageName: "seller2", name: "Ozge", price: "$123.45", isFollowing: true),
        SellerModel(index: 9, profileImageName: "seller1", name: "Emir", price: "$123.45", isFollowing: true),
        SellerModel(index: 10, profileImageName: "seller2", name: "Ozge", price: "$123.45", isFollowing: false),
    ]
    
    let tableView: UITableView = {
        let tableView = UITableView()
        tableView.separatorStyle = .none
        tableView.backgroundColor = .clear
        tableView.register(SellerTableViewCell.self, forCellReuseIdentifier: SellerTableViewCell.cellId)
        tableView.rowHeight = 82
        tableView.showsVerticalScrollIndicator = false
        return tableView
    }()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        configureNavBar()
        tableView.dataSource = self
        tableView.delegate = self
        view.addSubview(tableView)
        layout()
    }
    
    fileprivate func layout() {
        tableView.snp.makeConstraints { make in
            make.leading.equalToSuperview().offset(20)
            make.trailing.equalToSuperview().offset(-20)
            make.top.equalTo(view.snp.centerY)
            make.bottom.equalToSuperview()
        }
    }
    
    fileprivate func configureNavBar() {
        navigationItem.title = "Marketplace"
        let rightBarButtonItem = UIButton(type: .system)
        rightBarButtonItem.setImage(#imageLiteral(resourceName: "Group 29.png"), for: .normal)
        navigationController?.navigationBar.addSubview(rightBarButtonItem)
        
        rightBarButtonItem.snp.makeConstraints { make in
            make.trailing.equalToSuperview().offset(-20)
            make.top.equalToSuperview().offset(45)
            make.bottom.equalTo(navigationController!.navigationBar.snp.bottom)
        }
    }

    @objc func handleRing() {
        print("hello")
    }
    
    override func viewDidLayoutSubviews() {
        super.viewDidLayoutSubviews()
    }
}

extension HomeVC: UITableViewDataSource, UITableViewDelegate {
    
    func tableView(_ tableView: UITableView, viewForHeaderInSection section: Int) -> UIView? {
        let headerView = UIView()
        headerView.backgroundColor = .white
        
        let leftLabel = UILabel()
        leftLabel.font = Fonts.Heading.text18_bold
        leftLabel.text = "Top Sellers"
        leftLabel.textColor = UIColor(hex: "#393A90FF")
        
        let rightButton = UIButton(type: .system)
        rightButton.setTitleColor(UIColor(hex: "#A49BFEFF"), for: .normal)
        rightButton.setTitle("See All", for: .normal)
        rightButton.titleLabel?.font = Fonts.Heading.text18_semibold
        
        headerView.addSubview(leftLabel)
        headerView.addSubview(rightButton)
        
        leftLabel.snp.makeConstraints { make in
            make.centerY.equalToSuperview()
            make.leading.equalToSuperview().offset(8)
        }
        rightButton.snp.makeConstraints { make in
            make.centerY.equalToSuperview()
            make.trailing.equalToSuperview().offset(-8)
        }
        
        return headerView
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return sellers.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: SellerTableViewCell.cellId, for: indexPath) as! SellerTableViewCell
        cell.backgroundColor = .clear
        cell.seller = sellers[indexPath.row]
        return cell
    }
}
