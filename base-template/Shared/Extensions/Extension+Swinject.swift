//
//  Extension+Swinject.swift
//  base-template
//
//  Created by Ziad Ahmed on 31/12/2024.
//

import Swinject
import SwinjectStoryboard

extension Container {
    /**
     Retrieves UIViewController of the specified type. The UIViewController must conform to StoryboardLodable
     
     - Parameter serviceType: UIViewController type
     - Returns: UIViewController of specified type
     */
    func resolveViewController<ViewController: StoryboardLoadable>(_ viewControllerType: ViewController.Type) -> ViewController {
        let storyboard = SwinjectStoryboard.create(name: viewControllerType.storyboardName, bundle: nil, container: self)
        let identifier = "\(viewControllerType)".replacingOccurrences(of: "ViewController", with: "")
        return storyboard.instantiateViewController(withIdentifier: identifier) as! ViewController
    }
}
