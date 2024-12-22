//
//  MainCoordinator.swift
//  base-template
//
//  Created by Ziad Ahmed on 21/12/2024.
//

import UIKit

class MainCoordinator: Coordinator, CoordinatorFinishOutput {
    
    // MARK: - CoordinatorFinishOutput -
    
    var finishFlow: (() -> Void)?
    
    // MARK: - Vars & Lets -
    
    var childCoordinators = [Coordinator]()
    var navigationController: UINavigationController
    
    // MARK: - Coordinator -
    
    init(navigationController: UINavigationController) {
        self.navigationController = navigationController
    }
    
    // MARK: - Coordinator -
    
    func start() {
        let mainViewController = MainViewController.instantiate()
        
        mainViewController.onLogoutTapped = {
            self.finishFlow?()
        }
        
        navigationController.pushViewController(mainViewController, animated: false)
    }
    
    // MARK: - Private Methods -
}
