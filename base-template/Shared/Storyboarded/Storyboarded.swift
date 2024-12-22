//
//  Storyboarded.swift
//  base-template
//
//  Created by Ziad Ahmed on 21/12/2024.
//

import Foundation
import UIKit

/*
    MARK: NOTE!
    Each ViewController must have the same StoryboardID as its Class Name
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
