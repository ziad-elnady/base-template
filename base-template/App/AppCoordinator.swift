//
//  AppCoordinator.swift
//  base-template
//
//  Created by Ziad Ahmed on 21/12/2024.
//

import UIKit
import Swinject

enum AppChildCoordinator {
    case auth
    case main
}

class AppCoordinator: Coordinator {
    
    let container: Container
    
    var childCoordinators = [AppChildCoordinator:Coordinator]()
    var navigationController: UINavigationController
    
    init(container: Container, navigationController: UINavigationController) {
        self.container = container
        self.navigationController = navigationController
    }
    
    // MARK: Coordinator
    
    func start() {
        switch false {
        case true:
            runMainFlow()
        case false:
            runAuthFlow()
        }
    }
    
    // MARK: Private Methods
    
    private func runMainFlow() {
        let mainCoordinator = MainCoordinator(navigationController: navigationController)
        
        mainCoordinator.finishFlow = { [unowned self] in
            self.childCoordinators[.main] = nil
            self.navigationController.viewControllers.removeAll()
            self.runAuthFlow()
        }
        
        childCoordinators[.main] = mainCoordinator
        mainCoordinator.start()
    }
    
    private func runAuthFlow() {
        let authCoordinator = AuthCoordinator(navigationController: navigationController)
        
        authCoordinator.finishFlow = { [unowned self] in
            self.childCoordinators[.auth] = nil
            self.navigationController.viewControllers.removeAll()
            self.runMainFlow()
        }
        
        childCoordinators[.auth] = authCoordinator
        authCoordinator.start()
    }
}
