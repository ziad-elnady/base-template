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

class LoginViewController: BaseTableViewController, LoginViewControllerProtocol, AuthStoryboardLoadable {
    
    // MARK: - LoginViewControllerProtocol -
    
    var onBack: (() -> Void)?
    var onLogin: (() -> Void)?
    var onSignup: (() -> Void)?
    
    // MARK: - Outlets -
    
    @IBOutlet weak var emailTextField: UITextField!
    @IBOutlet weak var passwordTextField: UITextField!
    @IBOutlet weak var loginButton: UIButton!
    
    // MARK: - Vars & Lets -
    
    var loginViewModel: LoginViewModel!
    
    // MARK: - ViewController Lifecycle -
    
    override func viewDidLoad() {
        super.viewDidLoad()

        login()
    }
    
    // MARK: - IBActions -
    
    @IBAction func loginTapped(_ sender: Any) {
        onLogin?()
    }
    
    @IBAction func signUpTapped(_ sender: Any) {
        onSignup?()
    }
    
    // MARK: - private methods -
    
    private func login() {
        loginViewModel.login()
    }
}
