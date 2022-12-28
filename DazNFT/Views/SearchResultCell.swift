//
//  SearchResultCell.swift
//  DazNFT
//
//  Created by Emir Alkal on 28.12.2022.
//

import UIKit

class SearchResultCell: UITableViewCell {
    static let cellId = "SearchResultCell"
    let phoneHeight = UIScreen.main.bounds.height

    var seller: SellerModel! {
        didSet {
            DispatchQueue.main.async {
                (self.stackView.subviews[0] as? UIImageView)?.image = UIImage(named: self.seller.profileImageName)
                (self.stackView.subviews[1].subviews[0] as? UILabel)?.text = self.seller.name
                (self.stackView.subviews[1].subviews[1] as? UILabel)?.text = "\(self.seller.followersCounter ?? 0) Followers"

                if self.seller.isFollowing {
                    (self.stackView.subviews[3] as? UIButton)?.setTitleColor(.white, for: .normal)
                    (self.stackView.subviews[3] as? UIButton)?.backgroundColor = UIColor(hex: "#A49BFEFF")
                    (self.stackView.subviews[3] as? UIButton)?.setTitle("Follow", for: .normal)
                } else {
                    (self.stackView.subviews[3] as? UIButton)?.setTitleColor(UIColor(hex: "#9E9E9EFF"), for: .normal)
                    (self.stackView.subviews[3] as? UIButton)?.backgroundColor = UIColor(hex: "#F2F2F2FF")
                    (self.stackView.subviews[3] as? UIButton)?.setTitle("Unfollow", for: .normal)
                }
            }
        }
    }
    
    let containerView: UIView = {
        let view = UIView()
        view.backgroundColor = .white
        view.layer.cornerRadius = 10
        return view
    }()
    
    let stackView: UIStackView = {
        let stackView = UIStackView()
        stackView.axis = .horizontal
        stackView.spacing = 18
        return stackView
    }()
    
    let profileImageView: UIImageView = {
        let imageView = UIImageView()
        imageView.image = #imageLiteral(resourceName: "seller2")
        imageView.contentMode = .scaleAspectFit
        imageView.snp.makeConstraints { make in
            make.height.width.equalTo(44)
        }
        
        imageView.layer.cornerRadius = 22
        imageView.clipsToBounds = true
        return imageView
    }()
    
    let labelStack: UIStackView = {
        let stackView = UIStackView()
        stackView.axis = .vertical
        
        let nameLabel = UILabel()
        nameLabel.font = Fonts.Heading.text18_bold
        nameLabel.textColor = UIColor(hex: "#393A90FF")
        nameLabel.text = "Antonio"
        
        let followersLabel = UILabel()
        followersLabel.font = Fonts.General.text14_regular
        followersLabel.textColor = UIColor(hex: "#9E9E9EFF")
        followersLabel.text = "2.7k Followers"
        
        stackView.addArrangedSubview(nameLabel)
        stackView.addArrangedSubview(followersLabel)
        return stackView
    }()
    
    lazy var dummyView: UIView = {
        let view = UIView()
        view.snp.makeConstraints { make in
            if phoneHeight < 700 {
                make.width.equalTo(20)
            } else {
                make.width.equalTo(30)
            }
        }
        return view
    }()
    
    let followButton: UIButton = {
        let button = DazButton.makeButton()
        button.setTitle("Follow", for: .normal)
        button.layer.cornerRadius = 15
        button.backgroundColor = UIColor(hex: "#A49BFEFF")
        button.snp.makeConstraints { make in
            make.width.equalTo(88)
        }
        button.addTarget(nil, action: #selector(followButtonPressed), for: .touchUpInside)
        return button
    }()
    
    override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
        super.init(style: style, reuseIdentifier: reuseIdentifier)
        contentView.backgroundColor = .clear
        contentView.addSubview(containerView)
        containerView.addSubview(stackView)
        
        stackView.addArrangedSubview(profileImageView)
        stackView.addArrangedSubview(labelStack)
        stackView.addArrangedSubview(dummyView)
        stackView.addArrangedSubview(followButton)
        layout()
    }
    
    fileprivate func layout() {
        containerView.snp.makeConstraints { make in
            make.leading.equalToSuperview().offset(10)
            make.top.equalToSuperview().offset(5)
            make.trailing.equalToSuperview().offset(-10)
            make.bottom.equalToSuperview().offset(-5)
        }
        
        stackView.snp.makeConstraints { make in
            make.top.leading.equalToSuperview().offset(15)
            make.trailing.equalToSuperview().offset(-15)
        }
    }

    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    @objc func followButtonPressed() {
        seller.isFollowing = !seller.isFollowing
    }
    
}
