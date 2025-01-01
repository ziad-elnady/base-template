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
            MoyaProvider<AuthService>(plugins: [
                NetworkLoggerPlugin(configuration: .init(formatter: .init(responseData: JSONResponseDataFormatter),
                                                         logOptions: .verbose))
            ])
        }
        .inObjectScope(.container)
        
        container.register(LoginViewModel.self) { resolver in
            let userService = resolver.resolve(UserService.self)!
            let authService = resolver.resolve(MoyaProvider<AuthService>.self)!
            return LoginViewModel(userService: userService, authService: authService)
        }
        .inObjectScope(.container)
        
        container.register(SignupViewModel.self) { resolver in
            let authService = resolver.resolve(MoyaProvider<AuthService>.self)!
            return SignupViewModel(authService: authService)
        }
        
        // View controllers
        container.storyboardInitCompleted(LoginViewController.self) { resolver, loginViewController in
            loginViewController.loginViewModel = resolver.resolve(LoginViewModel.self)
        }
        
        container.storyboardInitCompleted(SignupViewController.self) { resolver, signupViewController in
            signupViewController.signupViewModel = resolver.resolve(SignupViewModel.self)
        }

    }
    
}
