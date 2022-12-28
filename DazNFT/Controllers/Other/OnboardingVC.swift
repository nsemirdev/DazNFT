//
//  ViewController.swift
//  DazNFT
//
//  Created by Emir Alkal on 27.12.2022.
//

import UIKit
import SnapKit

final class OnboardingVC: DNViewController, OnboardingVMDelegate {
    
    let viewModel = OnboardingViewModel()
    
    // MARK: - UI Elements
    let imageView: UIImageView = {
        let imageView = UIImageView()
        imageView.image = #imageLiteral(resourceName: "1 1")
        imageView.contentMode = .scaleAspectFit
        imageView.snp.makeConstraints { make in
            make.height.equalTo(296)
        }
        return imageView
    }()

    let pageControl: UIPageControl = {
        let pageControl = UIPageControl()
        pageControl.numberOfPages = 3
        pageControl.currentPageIndicatorTintColor = UIColor(hex: "#A49BFEFF")
        pageControl.pageIndicatorTintColor = UIColor(hex: "#C4C4C4FF")
        pageControl.isUserInteractionEnabled = false
        return pageControl
    }()
    
    let stackView: UIStackView = {
        let stackView = UIStackView()
        stackView.axis = .vertical
        stackView.spacing = 22
        return stackView
    }()
    
    let firstLabel: UILabel = {
        let label = UILabel()
        label.font = Fonts.Heading.text24_medium
        label.text = "First Open App"
        label.textAlignment = .center
        return label
    }()
    
    let secondLabel: UILabel = {
        let label = UILabel()
        label.font = Fonts.General.text12_regular
        label.text = "Lorem ipsum dolor sit amet, consectetur adipiscing elit. Nulla quam duis viverra mattis nullam turpis scelerisque pharetra. Amet, tortor et tortor sed habitant vitae vel. "
        label.textAlignment = .center
        label.textColor = UIColor(hex: "#9999A7FF")
        label.numberOfLines = 0
        return label
    }()

    let nextButton: UIButton = {
        let button = DazButton.makeButton()
        button.snp.makeConstraints { make in
            make.height.equalTo(55)
        }
        button.setTitle("Next", for: .normal)
        button.addTarget(nil, action: #selector(nextButtonPressed), for: .touchUpInside)
        return button
    }()
    
    let skipButton: UIButton = {
        let button = UIButton(type: .system)
        button.setTitle("Skip", for: .normal)
        button.setTitleColor(UIColor(hex: "#9999A7FF"), for: .normal)
        button.addTarget(nil, action: #selector(skipButtonPressed), for: .touchUpInside)
        return button
    }()
    
    let containerView: UIView = {
        let view = UIView()
        view.backgroundColor = .clear
        view.layer.cornerRadius = 16
        return view
    }()
    
    @objc func nextButtonPressed() {
        viewModel.nextButtonPressed()
    }
    
    @objc func skipButtonPressed() {
        viewModel.performSegue()
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        viewModel.delegate = self
        view.backgroundColor = .systemBackground
        
        view.addSubview(imageView)
        view.addSubview(pageControl)
        view.addSubview(containerView)
        containerView.addSubview(stackView)
        
        stackView.addArrangedSubview(firstLabel)
        stackView.addArrangedSubview(secondLabel)
        stackView.addArrangedSubview(nextButton)
        stackView.addArrangedSubview(skipButton)
        
        layout()
        checkPhoneMode()
    }
    
    fileprivate func checkPhoneMode() {
        if traitCollection.userInterfaceStyle == .dark {
            containerView.backgroundColor = #colorLiteral(red: 0.1294117647, green: 0.1490196078, blue: 0.1803921569, alpha: 1)
        } else if traitCollection.userInterfaceStyle == .light {
            containerView.backgroundColor = .clear
        }
    }
    
    fileprivate func layout() {
        imageView.snp.makeConstraints { make in
            make.top.equalTo(view.safeAreaLayoutGuide.snp.top).offset(30)
            make.leading.equalToSuperview().offset(40)
            make.trailing.equalToSuperview().offset(-40)
        }
        
        pageControl.snp.makeConstraints { make in
            make.centerX.equalToSuperview()
            make.top.equalTo(imageView.snp.bottom).offset(14)
        }
        
        containerView.snp.makeConstraints { make in
            make.leading.equalToSuperview().offset(21)
            make.trailing.equalToSuperview().offset(-21)
            make.bottom.equalTo(view.safeAreaLayoutGuide.snp.bottom).offset(-5)
        }
        
        stackView.snp.makeConstraints { make in
            make.leading.equalToSuperview().offset(20)
            make.trailing.equalToSuperview().offset(-20)
            make.top.equalToSuperview().offset(20)
            make.bottom.equalToSuperview().offset(-20)
        }
    }
    
    override func viewDidLayoutSubviews() {
        super.viewDidLayoutSubviews()
        nextButton.applyGradient(colors: [UIColor(hex: "#A49BFEFF")!.cgColor, UIColor(hex: "#7173EBFF")!.cgColor], cornerRadius: 20)
    }
    
    override func traitCollectionDidChange(_ previousTraitCollection: UITraitCollection?) {
        checkPhoneMode()
    }
}

