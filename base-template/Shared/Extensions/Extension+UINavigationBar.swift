//
//  Extension+UINavigationBar.swift
//  base-template
//
//  Created by Ziad Ahmed on 01/01/2025.
//

import UIKit

extension UINavigationBar {
    static func customNavBarStyle(color: UIColor, largeTextFont: UIFont, smallTextFont: UIFont, isTranslucent: Bool, barTintColor: UIColor?) {
        appearance().largeTitleTextAttributes = [NSAttributedString.Key.foregroundColor: color,
                                                 NSAttributedString.Key.font: largeTextFont]
        
        appearance().titleTextAttributes = [NSAttributedString.Key.foregroundColor: color,
                                            NSAttributedString.Key.font: smallTextFont]
        
        appearance().isTranslucent = isTranslucent
        
        if let barTintColor = barTintColor {
            appearance().barTintColor = barTintColor
        }
    }
}
