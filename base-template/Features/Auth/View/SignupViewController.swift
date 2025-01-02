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

class SignupViewController: BaseTableViewController, SignupViewControllerProtocol, AuthStoryboardLoadable {
    
    // MARK: - SignupViewControllerProtocol -
    
    var onBack: (() -> Void)?
    var onLogin: (() -> Void)?
    var onSignup: (() -> Void)?
    
    // MARK: - Outlets -
    
    @IBOutlet weak var usernameTextField: UITextField!
    @IBOutlet weak var emailTextField: UITextField!
    @IBOutlet weak var passwordTextField: UITextField!
    
    // MARK: - Vars & Lets -
    
    var signupViewModel: SignupViewModel!
    
    // MARK: - ViewController Lifecycle -
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        signup()
    }
    
    // MARK: - IBActions -
    
    @IBAction func signupTapped(_ sender: Any) {
        
    }
    
    @IBAction func loginTapped(_ sender: Any) {
        onLogin?()
    }
    
    // MARK: - Private methods -
    
    private func signup() {
        signupViewModel.signup()
    }

}
