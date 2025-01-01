//
//  LoginViewModel.swift
//  base-template
//
//  Created by Ziad Ahmed on 01/01/2025.
//

import Foundation
import Moya

final class LoginViewModel {
    
    private let userService: UserService
    private let authService: MoyaProvider<AuthService>
    
    init(userService: UserService, authService: MoyaProvider<AuthService>) {
        self.userService = userService
        self.authService = authService
    }
    
    func login() {
        print("login...")
    }
}
