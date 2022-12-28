//
//  SignUpVC.swift
//  DazNFT
//
//  Created by Emir Alkal on 28.12.2022.
//

import UIKit
import SnapKit



final class SignUpVC: DNViewController, SignUpVMDelegate {
    
    let viewModel = SignUpViewModel()
    var isCheckmarkChecked = false
    
    // MARK: - Scroll Stuff
    
    lazy var contentViewSize = CGSize(width: self.view.frame.width, height: self.view.frame.height) {
        didSet {
            scrollView.contentSize = contentViewSize
            containerView.frame.size = contentViewSize
        }
    }
    
    lazy var scrollView: UIScrollView = {
        let scrollView = UIScrollView()
        scrollView.frame = self.view.bounds
        scrollView.contentSize = contentViewSize
        return scrollView
    }()
    
    lazy var containerView: UIView = {
        let view = UIView()
        view.frame.size = contentViewSize
        return view
    }()
    
    // MARK: - UI Elements
    
    let logoImage: UIImageView = {
        let imageView = UIImageView()
        imageView.image = #imageLiteral(resourceName: "Group 1")
        imageView.contentMode = .scaleAspectFit
        return imageView
    }()
    
    let signUpLabel: UILabel = {
        let label = UILabel()
        label.text = "Sign Up"
        label.font = Fonts.Heading.text18_medium
        label.textColor = UIColor(hex: "#454459FF")
        label.textAlignment = .center
        return label
    }()
    
    let detailLabel: UILabel = {
        let label = UILabel()
        label.text = "Give us some of your information to get free access fieldly."
        label.numberOfLines = 0
        label.font = Fonts.General.text14_medium
        label.textColor = UIColor(hex: "#454459FF")
        label.textAlignment = .center
        return label
    }()
    
    let topStackView: UIStackView = {
        let stackView = UIStackView()
        stackView.axis = .vertical
        stackView.spacing = 12
        return stackView
    }()
    
    let nameTextField           = DazTextField(with: .username, placeholder: "Your Name")
    let mailTextField           = DazTextField(with: .mail, placeholder: "Your Email")
    let passwordTextField       = DazTextField(with: .password, placeholder: "Your Password")
    let retypePasswordTextField = DazTextField(with: .password, placeholder: "Confirm Password")
    
    let middleStackView: UIStackView = {
        let stackView = UIStackView()
        stackView.axis = .horizontal
        stackView.spacing = 14
        stackView.alignment = .top
        stackView.isUserInteractionEnabled = true
        
        let view = UIView()
        view.snp.makeConstraints { make in
            make.height.width.equalTo(23)
        }
        view.layer.cornerRadius = 5
        view.layer.borderWidth = 1
        view.layer.borderColor = #colorLiteral(red: 0.6451733708, green: 0.6105852723, blue: 0.9989337325, alpha: 1)
        
        let imageView = UIImageView()
        imageView.image = nil
        imageView.contentMode = .scaleAspectFit
        
        view.addSubview(imageView)
        imageView.snp.makeConstraints { make in
            make.top.leading.equalToSuperview().offset(4)
            make.trailing.bottom.equalToSuperview().offset(-4)
        }
        
        let label = UILabel()
        label.numberOfLines = 0
        label.text = "By creating an account you agree to the\nterms of use and our privacy policy."
        label.font = Fonts.General.text10_light
        
        stackView.addArrangedSubview(view)
        stackView.addArrangedSubview(label)
        
        return stackView
    }()
    
    let signUpButton: UIButton = {
        let button = DazButton.makeButton()
        button.snp.makeConstraints { make in
            make.height.equalTo(55)
        }
        button.setTitle("Sign Up", for: .normal)
        button.addTarget(nil, action: #selector(handleSignUp), for: .touchUpInside)
        return button
    }()
    
    let bottomStackView :UIStackView = {
        let stackView = UIStackView()
        stackView.axis = .horizontal
        stackView.spacing = 3
        
        let label = UILabel()
        label.text = "Already have an account?"
        label.textColor = UIColor(hex: "#393B3EFF")
        label.font = Fonts.General.text14_regular
        
        let button = UIButton()
        button.setTitle("Sign In", for: .normal)
        button.setTitleColor(UIColor(hex: "#5F61F0FF"), for: .normal)
        button.titleLabel?.font = Fonts.General.text14_bold
        
        stackView.addArrangedSubview(label)
        stackView.addArrangedSubview(button)
        
        return stackView
    }()
    
    // MARK: - Methods
    
    override func viewDidLoad() {
        super.viewDidLoad()
        viewModel.delegate = self
        configureNotifications()
        traitCollectionDidChange(traitCollection.userInterfaceStyle == .dark ? UITraitCollection(userInterfaceStyle: .light) : UITraitCollection(userInterfaceStyle: .dark))

        view.backgroundColor = .systemBackground
        view.addSubview(scrollView)
        scrollView.addSubview(containerView)
        
        containerView.addSubview(logoImage)
        containerView.addSubview(signUpLabel)
        containerView.addSubview(detailLabel)
        containerView.addSubview(topStackView)
        
        topStackView.addArrangedSubview(nameTextField)
        topStackView.addArrangedSubview(mailTextField)
        topStackView.addArrangedSubview(passwordTextField)
        topStackView.addArrangedSubview(retypePasswordTextField)
        topStackView.addArrangedSubview(middleStackView)
        topStackView.addArrangedSubview(signUpButton)
        
        containerView.addSubview(bottomStackView)
        
        layout()
        handleTapGestures()
        
    }

    override func viewDidLayoutSubviews() {
        super.viewDidLayoutSubviews()
        signUpButton.applyGradient(colors: [UIColor(hex: "#A49BFEFF")!.cgColor, UIColor(hex: "#7173EBFF")!.cgColor], cornerRadius: 20)
    }
    
    override func traitCollectionDidChange(_ previousTraitCollection: UITraitCollection?) {
        let textFields = [nameTextField, mailTextField, passwordTextField, retypePasswordTextField]

        if previousTraitCollection?.userInterfaceStyle == .dark {
            signUpLabel.textColor = UIColor(hex: "#454459FF")
            detailLabel.textColor = UIColor(hex: "#454459FF")
            (middleStackView.subviews[1] as! UILabel).textColor = UIColor(hex: "#393B3EFF")
            (bottomStackView.subviews[0] as! UILabel).textColor = UIColor(hex: "#393B3EFF")
            textFields.forEach { txt in
                txt.backgroundColor = .clear
            }
        } else if previousTraitCollection?.userInterfaceStyle == .light {
            (middleStackView.subviews[1] as! UILabel).textColor = UIColor(hex: "#DFDFFCFF")
            (bottomStackView.subviews[0] as! UILabel).textColor = UIColor(hex: "#DFDFFCFF")
            signUpLabel.textColor = UIColor(hex: "#EEEEEEFF")
            detailLabel.textColor = UIColor(hex: "#EEEEEEFF")
            textFields.forEach { txt in
                txt.backgroundColor = UIColor(hex: "#30373DFF")
            }
        }
    }
    
    fileprivate func layout() {
        let phoneHeight = view.frame.height
        
        logoImage.snp.makeConstraints { make in
            make.top.equalTo(containerView.snp.top).offset(phoneHeight < 700 ? 30 : 40 + UIApplication.safeAreaInsets.top)
            make.leading.equalToSuperview().offset(40)
            make.trailing.equalToSuperview().offset(-40)
        }
        
        signUpLabel.snp.makeConstraints { make in
            make.top.equalTo(logoImage.snp.bottom).offset(30)
            make.leading.equalToSuperview().offset(40)
            make.trailing.equalToSuperview().offset(-40)
        }
        
        detailLabel.snp.makeConstraints { make in
            make.top.equalTo(signUpLabel.snp.bottom).offset(phoneHeight < 700 ? 10 : 30)
            make.leading.equalToSuperview().offset(60)
            make.trailing.equalToSuperview().offset(-60)
        }
        
        topStackView.snp.makeConstraints { make in
            make.top.equalTo(detailLabel.snp.bottom).offset(phoneHeight < 700 ? 25: 45)
            make.leading.equalToSuperview().offset(40)
            make.trailing.equalToSuperview().offset(-40)
        }
        
        bottomStackView.snp.makeConstraints { make in
            make.centerX.equalTo(containerView.snp.centerX)
            make.top.equalTo(topStackView.snp.bottom).offset(phoneHeight < 700 ? 10 : 40)
        }
    }
    
    fileprivate func handleTapGestures() {
        let tapGesture = UITapGestureRecognizer(target: self, action: #selector(handleTap))
        middleStackView.addGestureRecognizer(tapGesture)
    }
    
    @objc func handleTap() {
        if (middleStackView.subviews[0].subviews[0] as! UIImageView).image == UIImage(systemName: "checkmark") {
            (middleStackView.subviews[0].subviews[0] as! UIImageView).image = nil
            isCheckmarkChecked = false
        } else {
            (middleStackView.subviews[0].subviews[0] as! UIImageView).image = UIImage(systemName: "checkmark")
            isCheckmarkChecked = true
        }
    }
    
    @objc func handleSignUp() {
        viewModel.handleSignUp()
    }
    
    // MARK: - Keyboard Stuff
    
    fileprivate func configureNotifications() {
        NotificationCenter.default.addObserver(self, selector: #selector(keyboardWillAppear), name: UIResponder.keyboardWillShowNotification, object: nil)
        NotificationCenter.default.addObserver(self, selector: #selector(keyboardWillDisappear), name: UIResponder.keyboardWillHideNotification, object: nil)
    }
    
    @objc func keyboardWillAppear() {
        contentViewSize = CGSize(width: self.view.frame.width, height: self.view.frame.height + 250)
    }
    
    @objc func keyboardWillDisappear() {
        contentViewSize = CGSize(width: self.view.frame.width, height: self.view.frame.height)
    }
}
