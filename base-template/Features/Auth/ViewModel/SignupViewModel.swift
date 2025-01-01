//
//  SignupViewModel.swift
//  base-template
//
//  Created by Ziad Ahmed on 01/01/2025.
//

import Foundation
import Moya

final class SignupViewModel {
    
    private let authService: MoyaProvider<AuthService>
    
    init(authService: MoyaProvider<AuthService>) {
        self.authService = authService
    }
    
    func signup() {
        print("signup...")
    }
    
}
