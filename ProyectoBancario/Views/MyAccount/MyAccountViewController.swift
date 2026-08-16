//
//  MyAccountViewController.swift
//  ProyectoBancario
//
//  Created by Jhonatan Chavez on 14/08/26.
//

import UIKit
import SwiftUI

class MyAccountViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
        self.view = UIHostingController(rootView: ProfileView()).view
        // Do any additional setup after loading the view.
    }
    
}


extension MyAccountViewController {
    static func build() -> UIViewController {
        let storyboard = UIStoryboard(name: "Main", bundle: nil)
        return storyboard.instantiateViewController(withIdentifier: "MyAccountViewControllerID")
    }
}
