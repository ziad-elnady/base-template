//
//  Extension+Storyboard.swift
//  base-template
//
//  Created by Ziad Ahmed on 31/12/2024.
//

import Foundation
import UIKit

/*
    MARK: NOTE!
        For each ViewController's ClassName must match the StoryboardID
        (for small projects)
 */

protocol Storyboarded {
    static func instantiate() -> Self
}

extension Storyboarded where Self: UIViewController {
    static func instantiate() -> Self {
        let id = String(describing: self)
        let storyboard = UIStoryboard(name: "Main", bundle: .main)
        return storyboard.instantiateViewController(withIdentifier: id) as! Self
    }
}
