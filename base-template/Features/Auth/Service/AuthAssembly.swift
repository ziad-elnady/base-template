//
//  AuthAssembly.swift
//  base-template
//
//  Created by Ziad Ahmed on 30/12/2024.
//

import Swinject
import Moya

class AuthAssembly: Assembly {
    
    func assemble(container: Container) {
        
        container.register(UserService.self) { _ in
            UserService()
        }
        .inObjectScope(.container)
        
        container.register(MoyaProvider<AuthService>.self) { _ in
            return MoyaProvider<AuthService>(plugins: [
                NetworkLoggerPlugin(configuration: .init(formatter: .init(responseData: JSONResponseDataFormatter),
                                                         logOptions: .verbose))
            ])
        }
        .inObjectScope(.container)
        
        // View controllers
        container.storyboardInitCompleted(LoginViewController.self) { container, viewController in
            
        }
        
        container.storyboardInitCompleted(SignupViewController.self) { container, viewController in
            
        }

    }
    
}
