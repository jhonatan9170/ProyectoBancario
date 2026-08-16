//
//  ProfileViewController.swift
//  ProyectoBancario
//
//  Created by Jhonatan Chavez on 11/08/26.
//

import UIKit
import SwiftUI

class ProfileViewController: UIViewController {
    
    override func viewDidLoad() {
        super.viewDidLoad()
        view = UIHostingController(rootView: ProfileView()).view
    }
    
}

extension ProfileViewController {
    static func build() -> UIViewController {
        let storyboard = UIStoryboard(name: "Main", bundle: nil)
        let viewController = storyboard.instantiateViewController(withIdentifier: "ProfileViewControllerID")
        return viewController
    }
}
