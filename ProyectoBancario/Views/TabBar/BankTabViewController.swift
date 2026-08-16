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
        
        let homeNavController = UINavigationController(rootViewController: HomeViewController.build())
        let transferViewController = TransferViewController.build()
        let forYouViewController = ForYouViewController.build()
        let myAccountViewController = ProfileViewController.build()
        
        homeNavController.tabBarItem = UITabBarItem(
            title: "Inicio",
            image: UIImage(named: "homeIcon"),
            tag: 1)
        
        transferViewController.tabBarItem = UITabBarItem(
            title: "Operaciones",
            image: UIImage(named: "transferIcon"),
            tag: 1)
        
        forYouViewController.tabBarItem = UITabBarItem(
            title: "Para ti",
            image: UIImage(named: "forYouIcon"),
            tag: 1)
        
        myAccountViewController.tabBarItem = UITabBarItem(
            title: "Mi cuenta",
            image: UIImage(named: "profileIcon"),
            tag: 1)

        viewControllers = [
            homeNavController,
            transferViewController,
            forYouViewController,
            myAccountViewController
        ]
        
    }

}
