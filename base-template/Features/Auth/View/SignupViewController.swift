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

class SignupViewController: UIViewController, SignupViewControllerProtocol, Storyboarded {
    
    var onBack: (() -> Void)?
    var onLogin: (() -> Void)?
    var onSignup: (() -> Void)?
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
    }
    
    @IBAction func loginTapped(_ sender: Any) {
        onLogin?()
    }

}
