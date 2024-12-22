//
//  LoginViewController.swift
//  base-template
//
//  Created by Ziad Ahmed on 21/12/2024.
//

import UIKit

protocol LoginViewControllerProtocol {
    var onBack: (() -> Void)? { get set }
    var onLogin: (() -> Void)? { get set }
    var onSignup: (() -> Void)? { get set }
}

class LoginViewController: UIViewController, LoginViewControllerProtocol, Storyboarded {
    
    var onBack: (() -> Void)?
    var onLogin: (() -> Void)?
    var onSignup: (() -> Void)?

    override func viewDidLoad() {
        super.viewDidLoad()

    }
    
    @IBAction func loginTapped(_ sender: Any) {
        onLogin?()
    }
    
    @IBAction func signUpTapped(_ sender: Any) {
        onSignup?()
    }
}