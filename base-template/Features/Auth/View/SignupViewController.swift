//
//  SignupViewController.swift
//  base-template
//
//  Created by Ziad Ahmed on 21/12/2024.
//

import UIKit

protocol SignupViewControllerProtocol {
    var onBack: (() -> Void)? { get set }
    var onLogin: (() -> Void)? { get set }
    var onSignup: (() -> Void)? { get set }
}

class SignupViewController: UIViewController, SignupViewControllerProtocol, AuthStoryboardLoadable {
    
    // MARK: - SignupViewControllerProtocol -
    
    var onBack: (() -> Void)?
    var onLogin: (() -> Void)?
    var onSignup: (() -> Void)?
    
    // MARK: - Vars & Lets -
    
    var signupViewModel: SignupViewModel!
    
    // MARK: - ViewController Lifecycle -
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        signup()
    }
    
    // MARK: - IBActions -
    
    @IBAction func loginTapped(_ sender: Any) {
        onLogin?()
    }
    
    // MARK: - Private methods -
    
    private func signup() {
        signupViewModel.signup()
    }

}
