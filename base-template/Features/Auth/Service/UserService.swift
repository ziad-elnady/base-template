//
//  UserService.swift
//  base-template
//
//  Created by Ziad Ahmed on 30/12/2024.
//

import Foundation

final class UserService {
    static let shared = UserService()
    
    private let keychainHelper = KeychainHelper.shared
    private let userDefaults = UserDefaults.standard
    
    init() {
        user = fetchUser()
    }
    
    private var user: User?
    
    // MARK: - Authentication
    func isAuthenticated() -> Bool {
        return loadToken() != nil
    }
    
    func saveToken(_ token: String) {
        keychainHelper.save(token, for: "token")
    }
    
    func loadToken() -> String? {
        return keychainHelper.load(for: "token")
    }
    
    // MARK: - User Management
    func fetchUser() -> User? {
        guard let userData = userDefaults.data(forKey: "user") else { return nil }
        do {
            let user = try JSONDecoder().decode(User.self, from: userData)
            return user
        } catch {
            print("Failed to decode user: \(error)")
            return nil
        }
    }
    
    func saveUser(_ user: User) {
        do {
            let userData = try JSONEncoder().encode(user)
            userDefaults.set(userData, forKey: "user")
            self.user = user
        } catch {
            print("Failed to encode user: \(error)")
        }
    }
    
    func logout() {
        userDefaults.removeObject(forKey: "user")
        keychainHelper.delete(for: "token")
        user = nil
    }
}
