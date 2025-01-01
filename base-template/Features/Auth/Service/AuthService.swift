//
//  AuthService.swift
//  base-template
//
//  Created by Ziad Ahmed on 30/12/2024.
//

import Foundation
import Moya

enum DEVEnvironmentURls {
    case development
    case staging
    case production
    
    var baseURL: String {
        switch self {
        case .development: return "https://dev.example.com/api/"
        case .staging: return "https://staging.example.com/api/"
        case .production: return "https://example.com/api/"
        }
    }
    
    static var current: DEVEnvironmentURls = .development
}

public enum AuthService {
    case login(email: String, password: String)
    case signUp(email: String, password: String, name: String)
}

extension AuthService: TargetType, AccessTokenAuthorizable {

    public var baseURL: URL {
        return URL(string: DEVEnvironmentURls.current.baseURL)!
    }

    public var path: String {
        switch self {
        case .login:
            return "login"
        case .signUp:
            return "signup"
        }
    }

    public var method: Moya.Method {
        return .post
    }

    public var task: Task {
        switch self {
        case let .login(email, password):
            return .requestParameters(parameters: ["email": email, "password": password], encoding: JSONEncoding.default)
        case let .signUp(email, password, name):
            return .requestParameters(parameters: ["name": name, "email": email, "password": password], encoding: JSONEncoding.default)
        }
    }

    public var headers: [String: String]? {
        var headers = ["Content-Type": "application/json"]
        if let token = UserService.shared.loadToken() {
            headers["Authorization"] = "Bearer \(token)"
        }
        return headers
    }

    public var authorizationType: AuthorizationType? {
        switch self {
        case .login, .signUp:
            return .none
        }
    }

    public var validationType: ValidationType {
        return .successCodes
    }

    public var sampleData: Data {
        switch self {
        case .login:
            return """
            {
                "token": "mockToken",
                "user": {
                    "id": 1,
                    "name": "Mock User",
                    "email": "mock@example.com"
                }
            }
            """.data(using: .utf8)!
        case .signUp:
            return """
            {
                "message": "User registered successfully."
            }
            """.data(using: .utf8)!
        }
    }
}

