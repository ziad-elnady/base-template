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
    
    // MARK: - Vars & Lets -
    
    internal let container: Container
    
    private let navigationController: UINavigationController
    private var childCoordinators = [AppChildCoordinator:Coordinator]()
    private var launchInscructor: LaunchInstructor
    
    // MARK: - Init -
    
    init(container: Container, navigationController: UINavigationController, launchInstructor: LaunchInstructor) {
        self.container = container
        self.navigationController = navigationController
        self.launchInscructor = launchInstructor
    }
    
    // MARK: Coordinator
    
    func start() {
        switch launchInscructor {
        case .auth:
            runAuthFlow()
        case .main:
            runMainFlow()
        }
    }
    
    // MARK: Private Methods
    
    private func runAuthFlow() {
        let authCoordinator = AuthCoordinator(container: container,
                                              navigationController: navigationController)
        
        authCoordinator.finishFlow = { [unowned self] in
            self.childCoordinators[.auth] = nil
            self.launchInscructor = .configure(isAuthorized: UserService.shared.isAuthenticated())
            self.navigationController.viewControllers.removeAll()
            self.runMainFlow()
        }
        
        childCoordinators[.auth] = authCoordinator
        authCoordinator.start()
    }
    
    private func runMainFlow() {
        let mainCoordinator = MainCoordinator(container: container,
                                              navigationController: navigationController)
        
        mainCoordinator.finishFlow = { [unowned self] in
            self.childCoordinators[.main] = nil
            self.navigationController.viewControllers.removeAll()
            self.runAuthFlow()
        }
        
        childCoordinators[.main] = mainCoordinator
        mainCoordinator.start()
    }
    
}
