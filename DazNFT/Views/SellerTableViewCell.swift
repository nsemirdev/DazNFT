//
//  SellerTableViewCell.swift
//  DazNFT
//
//  Created by Emir Alkal on 28.12.2022.
//

import UIKit
import SnapKit

class SellerTableViewCell: UITableViewCell {

    static let cellId = "SellerTableViewCell"
    
    var seller: SellerModel! {
        didSet {
            DispatchQueue.main.async {
                (self.stackView.subviews[0] as! UILabel).text = "\(self.seller.index)"
                (self.stackView.subviews[1] as! UIImageView).image = UIImage(named: self.seller.profileImageName)
                (self.stackView.subviews[2].subviews[0] as! UILabel).text = self.seller.name
                (self.stackView.subviews[2].subviews[1] as! UILabel).text = self.seller.price
                
                if self.seller.isFollowing {
                    (self.stackView.subviews[4] as! UIButton).setTitleColor(.white, for: .normal)
                    (self.stackView.subviews[4] as! UIButton).backgroundColor = UIColor(hex: "#A49BFEFF")
                    (self.stackView.subviews[4] as! UIButton).setTitle("Follow", for: .normal)
                } else {
                    (self.stackView.subviews[4] as! UIButton).setTitleColor(UIColor(hex: "#A49BFEFF"), for: .normal)
                    (self.stackView.subviews[4] as! UIButton).backgroundColor = .clear
                    (self.stackView.subviews[4] as! UIButton).setTitle("Following", for: .normal)
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
    
    let countLabel: UILabel = {
        let label = UILabel()
        label.font = Fonts.Heading.text18_bold
        label.textColor = UIColor(hex: "#393A90FF")
        label.text = "1"
        return label
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
        
        let priceLabel = UILabel()
        priceLabel.font = Fonts.General.text14_regular
        priceLabel.textColor = UIColor(hex: "#393A90FF")
        priceLabel.text = "$765,50"
        
        stackView.addArrangedSubview(nameLabel)
        stackView.addArrangedSubview(priceLabel)
        return stackView
    }()
    
    let dummyView: UIView = {
        let view = UIView()
        view.snp.makeConstraints { make in
            make.width.equalTo(30)
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
        return button
    }()
    
    override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
        super.init(style: style, reuseIdentifier: reuseIdentifier)
        contentView.backgroundColor = .clear
        contentView.addSubview(containerView)
        containerView.addSubview(stackView)
        
        stackView.addArrangedSubview(countLabel)
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
    
}
