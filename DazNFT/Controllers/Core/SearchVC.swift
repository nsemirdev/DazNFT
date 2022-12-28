//
//  SearchVC.swift
//  DazNFT
//
//  Created by Emir Alkal on 28.12.2022.
//

import UIKit
import SnapKit

final class SearchVC: DNViewController {
    
    var users: [SellerModel] = []
    
    let searchTextField: DazTextField = {
        let textField = DazTextField(with: .mail, placeholder: "Search Here")
        textField.layer.borderColor = UIColor(hex: "#9E9E9EFF")?.cgColor
        textField.stackView.subviews[0].removeFromSuperview()
        textField.snp.makeConstraints { make in
            make.height.equalTo(46)
        }
        textField.textField.snp.makeConstraints { make in
            make.centerY.equalTo(textField.snp.centerY)
        }
        let searchButton = UIButton(type: .system) // UIImageView(image: UIImage(named: "Group 28"))
        searchButton.setImage(UIImage(named: "Group 28")?.withRenderingMode(.alwaysOriginal), for: .normal)
        
        textField.addSubview(searchButton)
        
        searchButton.snp.makeConstraints { make in
            make.centerY.equalTo(textField.snp.centerY)
            make.trailing.equalTo(textField.snp.trailing).offset(-24)
        }
        
        return textField
    }()
    
    let settingsButton: UIButton = {
        let button = UIButton(type: .system)
        button.setImage(UIImage(named: "Frame 366")?.withRenderingMode(.alwaysOriginal), for: .normal)
        return button
    }()
    
    let stackView: UIStackView = {
        let stackView = UIStackView()
        stackView.axis = .vertical
        stackView.spacing = 25
        
        let label = UILabel()
        label.text = "Search results"
        label.font = Fonts.Heading.text18_bold
        label.textColor = UIColor(hex: "#454459FF")
        stackView.addArrangedSubview(label)
        
        return stackView
    }()
    
    let segmentedControl: UISegmentedControl = {
        let items = ["Items", "Users", "Collections"]
        let segmentedControl = UISegmentedControl(items: items)
        segmentedControl.snp.makeConstraints { make in
            make.height.equalTo(42)
        }
        segmentedControl.selectedSegmentIndex = 1
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
        tableView.register(SearchResultCell.self, forCellReuseIdentifier: SearchResultCell.cellId)
        tableView.rowHeight = 82
        tableView.showsVerticalScrollIndicator = false
        tableView.allowsSelection = false
        return tableView
    }()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        tableView.dataSource = self
        tableView.delegate = self
        view.addSubview(searchTextField)
        view.addSubview(settingsButton)
        view.addSubview(stackView)
        stackView.addArrangedSubview(segmentedControl)
        view.addSubview(tableView)
        layout()
        getUsers()
    }
    
    fileprivate func getUsers()  {
        sellers.forEach { seller in
            if seller.followersCounter != nil {
                self.users.append(seller)
            }
        }
    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        navigationController?.isNavigationBarHidden = true
    }
    
    fileprivate func layout() {
        searchTextField.snp.makeConstraints { make in
            make.top.equalTo(view.safeAreaLayoutGuide.snp.top).offset(40)
            make.leading.equalToSuperview().offset(20)
            make.trailing.equalToSuperview().offset(-80)
        }
        
        settingsButton.snp.makeConstraints { make in
            make.width.height.equalTo(46)
            make.centerY.equalTo(searchTextField.snp.centerY)
            make.leading.equalTo(searchTextField.snp.trailing).offset(15)
        }
        
        stackView.snp.makeConstraints { make in
            make.top.equalTo(settingsButton.snp.bottom).offset(40)
            make.leading.equalToSuperview().offset(20)
            make.trailing.equalToSuperview().offset(-20)
        }
        
        tableView.snp.makeConstraints { make in
            make.top.equalTo(stackView.snp.bottom).offset(28)
            make.leading.equalToSuperview().offset(17)
            make.trailing.equalToSuperview().offset(-17)
            make.bottom.equalTo(view.safeAreaLayoutGuide.snp.bottom)
        }
    }
}

extension SearchVC: UITableViewDataSource, UITableViewDelegate {

    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return users.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: SearchResultCell.cellId, for: indexPath) as! SearchResultCell
        cell.backgroundColor = .clear
        cell.seller = users[indexPath.row]
        return cell
    }
}
