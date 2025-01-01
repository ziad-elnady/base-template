//
//  AuthCoordinator.swift
//  base-template
//
//  Created by Ziad Ahmed on 21/12/2024.
//

import UIKit
import Swinject

final class AuthCoordinator: Coordinator, CoordinatorFinishOutput {
    
    // MARK: - CoordinatorFinishOutput -
    
    var finishFlow: (() -> Void)?
    
    // MARK: - Vars & Lets -
    
    internal let container: Container
    
    var childCoordinators = [Coordinator]()
    var navigationController: UINavigationController
    
    // MARK: - Coordinator -
    
    func start() {
        showLoginVC()
    }
    
    // MARK: - Init -
    
    init(container: Container, navigationController: UINavigationController) {
        self.container = container
        self.navigationController = navigationController
    }
    
    // MARK: - Private Methods -
    
    private func showLoginVC() {
        let loginVC = container.resolveViewController(LoginViewController.self)
        
        loginVC.onLogin = {
            self.finishFlow?()
        }
        
        loginVC.onSignup = {
            self.showSignupVC()
        }
        
        navigationController.pushViewController(loginVC, animated: true)
    }
    
    private func showSignupVC() {
        let signupVC = container.resolveViewController(SignupViewController.self)
        
        signupVC.onBack = { [unowned self] in
            self.navigationController.dismiss(animated: true)
        }
        
        signupVC.onSignup = {
            self.finishFlow?()
        }
        
        signupVC.onLogin = {
            self.navigationController.dismiss(animated: true)
        }
        
        navigationController.present(signupVC, animated: true)
    }
}
