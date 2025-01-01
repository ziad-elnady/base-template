//
//  LaunchInstructor.swift
//  base-template
//
//  Created by Ziad Ahmed on 31/12/2024.
//

import Foundation

enum LaunchInstructor {
    case auth
    case main
    
    // MARK: - Public methods -
    
    static func configure(isAuthorized: Bool = false) -> LaunchInstructor {
        switch isAuthorized {
        case false: return .auth
        case true: return .main
        }
    }
}
