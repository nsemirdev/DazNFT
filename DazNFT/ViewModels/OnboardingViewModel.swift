//
//  OnboardingViewModel.swift
//  DazNFT
//
//  Created by Emir Alkal on 28.12.2022.
//

import Foundation

import UIKit

protocol OnboardingVMDelegate {
    var pageControl: UIPageControl { get }
    var skipButton: UIButton { get }
    var firstLabel: UILabel { get }
    var imageView: UIImageView { get }
    var view: UIView! { get set }
    func present(_ viewControllerToPresent: UIViewController, animated flag: Bool, completion: (() -> Void)?)
}

final class OnboardingViewModel {
    var delegate: OnboardingVMDelegate?
    let pageImages = [#imageLiteral(resourceName: "1 1"), #imageLiteral(resourceName: "Group 151"), #imageLiteral(resourceName: "1 1")]
    
    func nextButtonPressed() {
        guard let delegate else { return }
        
        if delegate.pageControl.currentPage == 2 {
            performSegue()
        }
        
        if delegate.pageControl.currentPage < 2 {
            if delegate.pageControl.currentPage == 0 {
                delegate.firstLabel.text = "Select a Service"
            }
            if delegate.pageControl.currentPage == 1 {
                delegate.skipButton.isUserInteractionEnabled = false
                delegate.skipButton.setTitleColor(delegate.view.backgroundColor, for: .normal)
                delegate.firstLabel.text = "Pace a Bid"
            }
            
            delegate.pageControl.currentPage += 1
            delegate.imageView.image = pageImages[delegate.pageControl.currentPage]
        }
    }
    
    func performSegue() {
        let signInVC = SignUpVC()
        signInVC.modalPresentationStyle = .fullScreen
        signInVC.modalTransitionStyle = .crossDissolve // BUG HINT!
        UserDefaults.standard.set(true, forKey: "isOnboardingSceneSeen")
        delegate?.present(signInVC, animated: true, completion: nil)
    }
}
