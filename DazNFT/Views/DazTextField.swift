//
//  DazTextField.swift
//  DazNFT
//
//  Created by Emir Alkal on 28.12.2022.
//

import UIKit

final class DazTextField: UIView {

    override var intrinsicContentSize: CGSize { .init(width: 0, height: 55) }
    var type: TextFieldType
    
    // MARK: - UI Elements
    
    let stackView: UIStackView = {
        let stackView = UIStackView()
        stackView.translatesAutoresizingMaskIntoConstraints = false
        stackView.distribution = .fill
        stackView.axis = .horizontal
        stackView.spacing = 8
        return stackView
    }()
    
    lazy var leftImageView: UIImageView = {
        let imageView = UIImageView()
        imageView.image = type == .mail ? #imageLiteral(resourceName: "Group 6") : type == .username ? #imageLiteral(resourceName: "Group 10.png") : #imageLiteral(resourceName: "Group 7.png")
        imageView.contentMode = .scaleAspectFit
        imageView.widthAnchor.constraint(equalToConstant: 20).isActive = true
        return imageView
    }()
    
    lazy var rightImageView: UIImageView = {
        let imageView = UIImageView()
        imageView.image = #imageLiteral(resourceName: "Group 9")
        imageView.contentMode = .scaleAspectFit
        imageView.widthAnchor.constraint(equalToConstant: 20).isActive = true
        return imageView
    }()
    
    lazy var textField: UITextField = {
        let textField = UITextField()
        return textField
    }()
    
    // MARK: - Methods
    
    enum TextFieldType {
        case mail
        case password
        case username
    }
    
    init(with type: TextFieldType, placeholder: String) {
        self.type = type
        super.init(frame: .zero)
        configure(with: type)
        let attr = NSAttributedString(string: placeholder, attributes: [
            .foregroundColor: Colors.Text.last as Any
        ])
        textField.attributedPlaceholder = attr
        
        
    }
    
    fileprivate func darkMode() {
        backgroundColor = UIColor(hex: "#FFFFFFF")
    }
    
    fileprivate func lightMode() {
        backgroundColor = UIColor(hex: "#30373DFF")
    }
   
    fileprivate func configure(with type: TextFieldType) {
        layer.cornerRadius = 10
        layer.borderWidth = 1
        layer.borderColor = #colorLiteral(red: 0.6431372549, green: 0.6078431373, blue: 0.9960784314, alpha: 1)
        
        addSubview(stackView)
        
        NSLayoutConstraint.activate([
            stackView.leadingAnchor.constraint(equalTo: leadingAnchor, constant: 16),
            stackView.trailingAnchor.constraint(equalTo: trailingAnchor, constant: -16),
            stackView.topAnchor.constraint(equalTo: topAnchor, constant: 16)
        ])
        
        type == .password ? configurePassword() : type == .username ? configureUsername() : configureMail()
    }
    
    fileprivate func configureMail() {
        stackView.addArrangedSubview(leftImageView)
        stackView.addArrangedSubview(textField)
        textField.autocorrectionType = .no
        textField.autocapitalizationType = .none
        textField.keyboardType = .emailAddress
    }
    
    fileprivate func configurePassword() {
        stackView.addArrangedSubview(leftImageView)
        stackView.addArrangedSubview(textField)
        stackView.addArrangedSubview(rightImageView)
        textField.isSecureTextEntry = true
    }
    
    fileprivate func configureUsername() {
        stackView.addArrangedSubview(leftImageView)
        stackView.addArrangedSubview(textField)
        textField.autocorrectionType = .no
        textField.autocapitalizationType = .none
        textField.keyboardType = .default
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
}
