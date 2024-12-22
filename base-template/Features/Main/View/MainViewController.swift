//
//  MainViewController.swift
//  base-template
//
//  Created by Ziad Ahmed on 21/12/2024.
//

import UIKit

protocol MainViewControllerProtocol {
    var onLogoutTapped: (() -> Void)? { get set }
}

class MainViewController: UIViewController, MainViewControllerProtocol, Storyboarded {
    
    // MARK: - MainViewControllerProtocol -
    
    var onLogoutTapped: (() -> Void)?
    
    // MARK: - App Life Cycle -

    override func viewDidLoad() {
        super.viewDidLoad()

        title = "Main"
    }
    
    // MARK: - Actions -
    
    @IBAction func logoutTapped(_ sender: Any) {
        onLogoutTapped?()
    }
    
}
