//
//  NFTCollectionViewCell.swift
//  DazNFT
//
//  Created by Emir Alkal on 28.12.2022.
//

import UIKit
import SnapKit

class NFTCollectionViewCell: UICollectionViewCell {
    
    let phoneHeight = UIScreen.main.bounds.height
    static let cellId = "NFTCollectionViewCell"
    var nftModel: NFT! {
        didSet {
            DispatchQueue.main.async {
                self.imageView.image = UIImage(named: self.nftModel.imageString)
                (self.leadingStackView.subviews[0] as! UILabel).text = self.nftModel.name
                (self.leadingStackView.subviews[1] as! UILabel).text = self.nftModel.author
                (self.leadingStackView.subviews[2] as! UILabel).text = self.nftModel.passedTime
                (self.trailingStackView.subviews[1] as! UILabel).text = self.nftModel.price
            }
        }
    }
    
    let imageView: UIImageView = {
        let imageView = UIImageView()
        imageView.image = #imageLiteral(resourceName: "Mask Group")
        imageView.contentMode = .scaleAspectFit
        return imageView
    }()
    
    lazy var leadingStackView: UIStackView = {
        let stackView = UIStackView()
        stackView.axis = .vertical
        stackView.spacing = self.phoneHeight < 700 ? 2 : 6
        stackView.alignment = .leading
        
        let firstLabel = UILabel()
        firstLabel.font = Fonts.Heading.text18_bold
        firstLabel.textColor = UIColor(hex: "#393A90FF")
        firstLabel.text = "Design Mania"
        
        let secondLabel = UILabel()
        secondLabel.font = Fonts.General.text12_regular
        secondLabel.textColor = UIColor(hex: "#393B3EA0")
        secondLabel.text = "by Ozge"
        
        let thirdLabel = UILabel()
        thirdLabel.font = Fonts.General.text12_regular
        thirdLabel.textColor = UIColor(hex: "#393B3EFF")
        thirdLabel.text = "22min ago"
        
        stackView.addArrangedSubview(firstLabel)
        stackView.addArrangedSubview(secondLabel)
        stackView.addArrangedSubview(thirdLabel)
        
        return stackView
    }()
    
    lazy var trailingStackView: UIStackView = {
        let stackView = UIStackView()
        stackView.spacing = phoneHeight < 700 ? 2 : 6
        stackView.alignment = .trailing
        stackView.axis = .vertical
        
        let firstLabel = UILabel()
        firstLabel.font = Fonts.General.text12_regular
        firstLabel.textColor = UIColor(hex: "#393B3EA0")
        firstLabel.text = "Highest Bid"
        
        let secondLabel = UILabel()
        secondLabel.font = Fonts.General.text14_regular
        secondLabel.textColor = UIColor(hex: "#A49BFEFF")
        secondLabel.text = "0.09 ETH"
        
        let thirdButton = DazButton.makeButton()
        thirdButton.setTitle("Bid", for: .normal)
        thirdButton.layer.cornerRadius = 7
        thirdButton.backgroundColor = UIColor(hex: "#A49BFEFF")
        thirdButton.snp.makeConstraints { make in
            make.height.equalTo(self.phoneHeight < 700 ? 20 : 25)
            make.width.equalTo(self.phoneHeight < 700 ? 60 : 70)
        }
        
        stackView.addArrangedSubview(firstLabel)
        stackView.addArrangedSubview(secondLabel)
        stackView.addArrangedSubview(thirdButton)
        
        return stackView
    }()
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        contentView.addSubview(imageView)
        contentView.addSubview(leadingStackView)
        contentView.addSubview(trailingStackView)
        layout()
    }
    
    fileprivate func layout() {
        imageView.snp.makeConstraints { make in
            make.top.equalToSuperview().offset(phoneHeight < 700 ? 1 : 24)
            make.leading.equalToSuperview().offset(20)
            make.trailing.equalToSuperview().offset(-20)
        }
        
        leadingStackView.snp.makeConstraints { make in
            make.leading.equalToSuperview().offset(phoneHeight < 700 ? 10 : 23)
            make.top.equalTo(imageView.snp.bottom).offset(phoneHeight < 700 ? 4 : 23)
        }
        
        trailingStackView.snp.makeConstraints { make in
            make.trailing.equalToSuperview().offset(phoneHeight < 700 ? -10 : -23)
            make.top.equalTo(imageView.snp.bottom).offset(phoneHeight < 700 ? 4 : 23)
        }
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
}
