//
//  MainCoordinator.swift
//  base-template
//
//  Created by Ziad Ahmed on 21/12/2024.
//

import UIKit
import Swinject

class MainCoordinator: Coordinator, CoordinatorFinishOutput {
    
    // MARK: - CoordinatorFinishOutput -
    
    var finishFlow: (() -> Void)?
    
    // MARK: - Vars & Lets -
    internal let container: Container
    
    var childCoordinators = [Coordinator]()
    var navigationController: UINavigationController
    
    // MARK: - Coordinator -
    
    init(container: Container, navigationController: UINavigationController) {
        self.container = container
        self.navigationController = navigationController
    }
    
    // MARK: - Coordinator -
    
    func start() {
        let mainViewController = container.resolveViewController(MainViewController.self)
        
        mainViewController.onLogoutTapped = {
            self.finishFlow?()
        }
        
        navigationController.pushViewController(mainViewController, animated: false)
    }
    
    // MARK: - Private Methods -
}
