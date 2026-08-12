//
//  BankTabViewController.swift
//  ProyectoBancario
//
//  Created by Jhonatan Chavez on 11/08/26.
//

import UIKit

class BankTabViewController: UITabBarController {

    override func viewDidLoad() {
        super.viewDidLoad()
        
        let homeViewController = HomeViewController.build()
        let transferViewController = TransferViewController.build()
        let forYouViewController = ForYouViewController.build()
        let myAccountViewController = ProfileViewController.build()
        
        homeViewController.tabBarItem = UITabBarItem(
            title: "Inicio",
            image: UIImage(systemName: "house"),
            tag: 1)
        
        transferViewController.tabBarItem = UITabBarItem(
            title: "Operaciones",
            image: UIImage(systemName: "transfer"),
            tag: 1)
        
        forYouViewController.tabBarItem = UITabBarItem(
            title: "Para ti",
            image: UIImage(systemName: "gift"),
            tag: 1)
        
        myAccountViewController.tabBarItem = UITabBarItem(
            title: "Mi cuenta",
            image: UIImage(systemName: "person"),
            tag: 1)

        viewControllers = [
            homeViewController,
            transferViewController,
            forYouViewController,
            myAccountViewController
        ]
        
    }

}
