//
//  SuccessVC.swift
//  DazNFT
//
//  Created by Emir Alkal on 28.12.2022.
//

import UIKit
import SnapKit

final class SuccessVC: DNViewController {

    let successImage: UIImageView = {
        let imageView = UIImageView()
        imageView.image = UIImage(named: "right 1")
        imageView.contentMode = .scaleAspectFit
        return imageView
    }()
    
    let headingLabel: UILabel = {
        let label = UILabel()
        label.text = "Congrats"
        label.font = Fonts.Heading.text24_medium
        label.textColor = UIColor(hex: "#454459FF")
        return label
    }()
    
    let detailLabel: UILabel = {
        let label = UILabel()
        label.text = "Lorem ipsum dolor sit amet, consectetur adipiscing elit. Velit nisl id blandit nulla magna leo, ipsum netus feugiat."
        label.numberOfLines = 0
        label.textAlignment = .center
        label.font = Fonts.General.text14_regular
        label.textColor = UIColor(hex: "#9E9E9EFF")
        return label
    }()
    
    let goToHomeButton: UIButton = {
        let button = DazButton.makeButton()
        button.setTitle("Go To Home", for: .normal)
        button.addTarget(nil, action: #selector(goToHomeButtonTapped), for: .touchUpInside)
        return button
    }()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = .systemBackground
        view.addSubview(successImage)
        view.addSubview(headingLabel)
        view.addSubview(detailLabel)
        view.addSubview(goToHomeButton)
        
        layout()
    }
    
    override func viewDidLayoutSubviews() {
        super.viewDidLayoutSubviews()
        goToHomeButton.applyGradient(colors: [UIColor(hex: "#A49BFEFF")!.cgColor, UIColor(hex: "#7173EBFF")!.cgColor], cornerRadius: 20)
    }
    
    fileprivate func layout() {
        successImage.snp.makeConstraints { make in
            make.top.equalToSuperview().offset(80)
            make.leading.equalToSuperview().offset(60)
            make.trailing.equalToSuperview().offset(-60)
        }
        
        headingLabel.snp.makeConstraints { make in
            make.centerX.equalToSuperview()
            make.top.equalTo(successImage.snp.bottom).offset(100)
        }
        
        detailLabel.snp.makeConstraints { make in
            make.leading.equalToSuperview().offset(50)
            make.trailing.equalToSuperview().offset(-50)
            make.top.equalTo(headingLabel.snp.bottom).offset(18)
        }
        
        goToHomeButton.snp.makeConstraints { make in
            make.leading.equalToSuperview().offset(40)
            make.trailing.equalToSuperview().offset(-40)
            make.bottom.equalTo(view.safeAreaLayoutGuide.snp.bottom).offset(-40)
            make.height.equalTo(55)
        }
    }
    
    @objc func goToHomeButtonTapped() {
        let mainTabBar = MainTabBar()
        mainTabBar.modalPresentationStyle = .fullScreen
        mainTabBar.modalTransitionStyle = .crossDissolve // BUG HINT!
        present(mainTabBar, animated: true)
    }
}
