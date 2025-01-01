//
//  K+Storyboard.swift
//  base-template
//
//  Created by Ziad Ahmed on 31/12/2024.
//

import UIKit

enum KStoryboard: String {
    case Auth
    case Main
}

protocol StoryboardLoadable: AnyObject {
    @nonobjc static var storyboardName: String { get }
}

// MARK: - Auth -

protocol AuthStoryboardLoadable: StoryboardLoadable { }

extension AuthStoryboardLoadable where Self: UIViewController {
    @nonobjc static var storyboardName: String {
        return KStoryboard.Auth.rawValue
    }
}

// MARK: - Main -

protocol MainStoryboardLoadable: StoryboardLoadable { }

extension MainStoryboardLoadable where Self: UIViewController {
    @nonobjc static var storyboardName: String {
        return KStoryboard.Main.rawValue
    }
}
