//
//  ExploreVC.swift
//  DazNFT
//
//  Created by Emir Alkal on 29.12.2022.
//

import UIKit
import SnapKit

class ExploreVC: DNViewController {

    let segmentedControl: UISegmentedControl = {
        let items = ["All", "Following"]
        let segmentedControl = UISegmentedControl(items: items)
        segmentedControl.snp.makeConstraints { make in
            make.height.equalTo(42)
        }
        segmentedControl.selectedSegmentIndex = 0
        segmentedControl.selectedSegmentTintColor = UIColor(hex: "#A49BFEFF")
        segmentedControl.setTitleTextAttributes([
            .foregroundColor: UIColor.white
        ], for: .selected)
        segmentedControl.setTitleTextAttributes([
            .foregroundColor: UIColor(hex: "#9E9E9EFF")!
        ], for: .normal)
        return segmentedControl
    }()
    
    let tableView: UITableView = {
        let tableView = UITableView()
        tableView.separatorStyle = .none
        tableView.backgroundColor = .clear
        tableView.register(NFTTableViewCell.self, forCellReuseIdentifier: NFTTableViewCell.cellId)
        tableView.rowHeight = 305
        tableView.showsVerticalScrollIndicator = false
        tableView.allowsSelection = false
        return tableView
    }()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        configureNavBar()
        tableView.delegate = self
        tableView.dataSource = self
        view.addSubview(segmentedControl)
        view.addSubview(tableView)
        layout()
    }
    
    fileprivate func layout() {
        segmentedControl.snp.makeConstraints { make in
            make.top.equalTo(view.safeAreaLayoutGuide.snp.top).offset(20)
            make.leading.equalToSuperview().offset(20)
            make.trailing.equalToSuperview().offset(-20)
        }
        
        tableView.snp.makeConstraints { make in
            make.top.equalTo(segmentedControl.snp.bottom).offset(20)
            make.leading.equalToSuperview().offset(20)
            make.trailing.equalToSuperview().offset(-20)
            make.bottom.equalTo(view.safeAreaLayoutGuide.snp.bottom)
        }
    }
    
    
    fileprivate func configureNavBar() {
        navigationItem.title = "Explore"
        let rightBarButtonItem = UIButton(type: .system)
        rightBarButtonItem.setImage(#imageLiteral(resourceName: "Group 148.png"), for: .normal)
        navigationController?.navigationBar.addSubview(rightBarButtonItem)
        
        rightBarButtonItem.snp.makeConstraints { make in
            make.trailing.equalToSuperview().offset(-20)
            make.bottom.equalTo(navigationController!.navigationBar.snp.bottom)
        }
    }
}

extension ExploreVC: UITableViewDelegate, UITableViewDataSource {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return nfts.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: NFTTableViewCell.cellId, for: indexPath) as! NFTTableViewCell
        cell.nftModel = nfts[indexPath.row]
        cell.backgroundColor = .clear
        return cell
    }
}
