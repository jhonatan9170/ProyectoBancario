//
//  BankTabViewController.swift
//  ProyectoBancario
//
//  Created by Jhonatan Chavez on 14/08/26.
//

import UIKit

class BankTabViewController: UITabBarController {

    override func viewDidLoad() {
        super.viewDidLoad()
       
        let homeVc = HomeViewController.build()
        let homeNavigationController = UINavigationController(rootViewController: homeVc)
        let transferVc = TransferViewController.build()
        let foryouVC = ForYouViewController.build()
        let myaccountVc = MyAccountViewController.build()
        
        homeNavigationController.tabBarItem =
        UITabBarItem(title: "Home",
                     image: UIImage(named: "homeIcon"),
                     tag: 0
        )
        transferVc.tabBarItem = UITabBarItem(title: "Operaciones",
                                             image: UIImage(named: "transferIcon"), tag: 1)
        foryouVC.tabBarItem = UITabBarItem(title: "Para ti", image: UIImage(named: "forYouIcon"), tag: 2)
        myaccountVc.tabBarItem = UITabBarItem(title: "Mi cuenta", image: UIImage(named: "profileIcon"), tag: 3)
        
        viewControllers = [
            homeNavigationController,
            transferVc,
            foryouVC,
            myaccountVc
        ]
        
    }

}
