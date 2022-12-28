//
//  HomeVC.swift
//  DazNFT
//
//  Created by Emir Alkal on 28.12.2022.
//

import UIKit
import SnapKit

class HomeVC: DNViewController {
    
    let tableView: UITableView = {
        let tableView = UITableView()
        tableView.separatorStyle = .none
        tableView.backgroundColor = .clear
        tableView.register(SellerTableViewCell.self, forCellReuseIdentifier: SellerTableViewCell.cellId)
        tableView.rowHeight = 82
        tableView.showsVerticalScrollIndicator = false
        tableView.allowsSelection = false
        return tableView
    }()
    
    let collectionView: UICollectionView = {
        let layout: UICollectionViewFlowLayout = UICollectionViewFlowLayout()
        layout.sectionInset = UIEdgeInsets(top: 0, left: 8, bottom: 0, right: 16)
        // %6 width
        // %34 height
//        print( UIScreen.main.bounds.width * 6 / 100)
        layout.itemSize = .init(width: UIScreen.main.bounds.width * 60 / 100,
                                height: UIScreen.main.bounds.height * 36 / 100)
//        layout.itemSize = CGSize(width: 250, height: 290)
        layout.scrollDirection = .horizontal
        
        let collectionView = UICollectionView(frame: .zero, collectionViewLayout: layout)
        collectionView.register(NFTCollectionViewCell.self, forCellWithReuseIdentifier: NFTCollectionViewCell.cellId)
        collectionView.backgroundColor = .clear
        collectionView.showsHorizontalScrollIndicator = false
        return collectionView
    }()
    
    let collectionViewHeader: UIView = {
        let view = UIView()
        view.backgroundColor = .clear
        
        let leftLabel = UILabel()
        leftLabel.font = Fonts.Heading.text18_bold
        leftLabel.text = "Top NFTs"
        leftLabel.textColor = UIColor(hex: "#393A90FF")
        
        let rightButton = UIButton(type: .system)
        rightButton.setTitleColor(UIColor(hex: "#A49BFEFF"), for: .normal)
        rightButton.setTitle("See All", for: .normal)
        rightButton.titleLabel?.font = Fonts.Heading.text18_semibold
        
        view.addSubview(leftLabel)
        view.addSubview(rightButton)
        
        leftLabel.snp.makeConstraints { make in
            make.centerY.equalToSuperview()
            make.leading.equalToSuperview().offset(8)
        }
        rightButton.snp.makeConstraints { make in
            make.centerY.equalToSuperview()
            make.trailing.equalToSuperview().offset(-8)
        }
        
        return view
    }()
    
    let tableViewHeader: UIView = {
        let view = UIView()
        view.backgroundColor = .clear
        
        let leftLabel = UILabel()
        leftLabel.font = Fonts.Heading.text18_bold
        leftLabel.text = "Top Sellers"
        leftLabel.textColor = UIColor(hex: "#393A90FF")
        
        let rightButton = UIButton(type: .system)
        rightButton.setTitleColor(UIColor(hex: "#A49BFEFF"), for: .normal)
        rightButton.setTitle("See All", for: .normal)
        rightButton.titleLabel?.font = Fonts.Heading.text18_semibold
        
        view.addSubview(leftLabel)
        view.addSubview(rightButton)
        
        leftLabel.snp.makeConstraints { make in
            make.centerY.equalToSuperview()
            make.leading.equalToSuperview().offset(8)
        }
        rightButton.snp.makeConstraints { make in
            make.centerY.equalToSuperview()
            make.trailing.equalToSuperview().offset(-8)
        }
        
        view.snp.makeConstraints { make in
            make.height.equalTo(28)
        }
        
        return view
    }()

    
    override func viewDidLoad() {
        super.viewDidLoad()
        configureNavBar()
        tableView.dataSource = self
        tableView.delegate = self
        collectionView.dataSource = self
        collectionView.delegate = self
        view.addSubview(tableView)
        view.addSubview(collectionView)
        view.addSubview(collectionViewHeader)
        view.addSubview(tableViewHeader)
        layout()
    }
    
    fileprivate func layout() {
        collectionViewHeader.snp.makeConstraints { make in
            make.leading.equalToSuperview().offset(20)
            make.trailing.equalToSuperview().offset(-20)
            make.top.equalTo(view.safeAreaLayoutGuide.snp.top).offset(28)
        }
        
        collectionView.snp.makeConstraints { make in
            make.top.equalTo(collectionViewHeader.snp.bottom).offset(12)
            make.leading.equalToSuperview().offset(20)
            make.trailing.equalToSuperview()
            make.bottom.equalTo(view.snp.centerY).offset(85)
        }
        
        tableViewHeader.snp.makeConstraints { make in
            make.leading.equalToSuperview().offset(20)
            make.trailing.equalToSuperview().offset(-20)
            make.top.equalTo(collectionView.snp.bottom).offset(20)
        }
        
        tableView.snp.makeConstraints { make in
            make.leading.equalToSuperview().offset(20)
            make.trailing.equalToSuperview().offset(-20)
            make.top.equalTo(tableViewHeader.snp.bottom).offset(20)
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
}

extension HomeVC: UITableViewDataSource, UITableViewDelegate {

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

extension HomeVC: UICollectionViewDataSource, UICollectionViewDelegate {
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let item = collectionView.dequeueReusableCell(withReuseIdentifier: NFTCollectionViewCell.cellId, for: indexPath) as! NFTCollectionViewCell
        item.backgroundColor = .white
        item.layer.cornerRadius = 20
        item.nftModel = nfts[indexPath.item]
        return item
    }
    
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return nfts.count
    }
    
}
