//
//  Coordinator.swift
//  base-template
//
//  Created by Ziad Ahmed on 21/12/2024.
//

import UIKit
//import Swinject

protocol CoordinatorFinishOutput {
    var finishFlow: (() -> Void)? { get set }
}

protocol Coordinator {
    
    /**
        DI container
     */
//    var container: Container { get }
    
    /**
        Entry point starting the coordinator
     */
    func start()
}

protocol NavigationCoordinator: Coordinator {
    /**
     Navigation controller
     */
    var navigationController: UINavigationController { get }
}
