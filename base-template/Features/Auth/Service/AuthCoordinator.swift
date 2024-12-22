//
//  AuthCoordinator.swift
//  base-template
//
//  Created by Ziad Ahmed on 21/12/2024.
//

import UIKit

final class AuthCoordinator: Coordinator, CoordinatorFinishOutput {
    
    // MARK: - CoordinatorFinishOutput -
    
    var finishFlow: (() -> Void)?
    
    // MARK: - Vars & Lets -
    
    var childCoordinators = [Coordinator]()
    var navigationController: UINavigationController
    
    // MARK: - Coordinator -
    
    func start() {
        showLoginVC()
    }
    
    // MARK: - Init -
    
    init(navigationController: UINavigationController) {
        self.navigationController = navigationController
    }
    
    // MARK: - Private Methods -
    
    private func showLoginVC() {
        let loginVC = LoginViewController.instantiate()
        
        loginVC.onLogin = {
            self.finishFlow?()
        }
        
        loginVC.onSignup = {
            self.showSignupVC()
        }
        
        navigationController.pushViewController(loginVC, animated: true)
    }
    
    private func showSignupVC() {
        let signupVC = SignupViewController.instantiate()
        
        signupVC.onSignup = {
            self.finishFlow?()
        }
        
        signupVC.onLogin = {
            self.navigationController.popViewController(animated: true)
        }
        
        navigationController.pushViewController(signupVC, animated: true)
    }
}
