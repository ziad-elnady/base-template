//
//  User.swift
//  base-template
//
//  Created by Ziad Ahmed on 30/12/2024.
//

import Foundation

struct User: Codable {
    let id: String
    let name: String
    let email: String

    init(id: String, name: String, email: String) {
        self.id = id
        self.name = name
        self.email = email
    }
}
