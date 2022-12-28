//
//  SignUpViewModel.swift
//  DazNFT
//
//  Created by Emir Alkal on 28.12.2022.
//

import UIKit

protocol SignUpVMDelegate {
    var nameTextField: DazTextField { get }
    var mailTextField: DazTextField { get }
    var passwordTextField: DazTextField { get }
    var retypePasswordTextField: DazTextField { get }
    var isCheckmarkChecked: Bool { get set }
    var middleStackView: UIStackView { get }
    func present(_ viewControllerToPresent: UIViewController, animated flag: Bool, completion: (() -> Void)?)
}

final class SignUpViewModel {
    var delegate: SignUpVMDelegate?
    var error = false
    
    func handleSignUp() {
        guard let delegate else { return }
        print(validateFields(delegate))
    }
    
    fileprivate func validateFields(_ viewModel: SignUpVMDelegate) -> Bool {
        let textFields = [viewModel.nameTextField, viewModel.mailTextField,
                          viewModel.passwordTextField, viewModel.retypePasswordTextField]
        error = false
        textFields.forEach { dazTxt in
            if dazTxt.textField.text == "" {
                animateError(with: dazTxt)
            }
        }
        
        if !viewModel.isCheckmarkChecked {
            animateError(with: viewModel.middleStackView.subviews[0])
        }
        
        if !error {
            if viewModel.passwordTextField.textField.text != viewModel.retypePasswordTextField.textField.text {
                animateError(with: viewModel.passwordTextField)
                animateError(with: viewModel.retypePasswordTextField)
            }
        }
        
        if error {
            return false
        } else {
            performSegue()
            return true
        }
    }
    
    fileprivate func performSegue() {
        let successVC = SuccessVC()
        successVC.modalPresentationStyle = .fullScreen
        successVC.modalTransitionStyle = .crossDissolve // BUG HINT!
        UserDefaults.standard.set(true, forKey: "isUserLogin")
        delegate?.present(successVC, animated: true, completion: nil)
    }
    
    fileprivate func animateError(with view: UIView) {
        error = true
        
        UIView.animate(withDuration: 0.3, delay: 0) {
            view.layer.borderColor = UIColor.red.cgColor
            view.layer.borderWidth = 2
        } completion: { _ in
            UIView.animate(withDuration: 0.3, delay: 0) {
                view.layer.borderWidth = 1
                view.layer.borderColor = #colorLiteral(red: 0.6451733708, green: 0.6105852723, blue: 0.9989337325, alpha: 1)
            }
        }

        UIView.animate(withDuration: 0.3, delay: 0) {
            view.layer.borderWidth = 2
        }
    }
}
