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
        let transferVc = TransferViewController.build()
        let foryouVC = ForYouViewController.build()
        let myaccountVc = MyAccountViewController.build()
        
        homeVc.tabBarItem = UITabBarItem(title: "Home", image: UIImage(systemName: "house"), tag: 0)
        transferVc.tabBarItem = UITabBarItem(title: "Operaciones", image: UIImage(systemName: "arrow.left.arrow.right.circle.fill"), tag: 1)
        foryouVC.tabBarItem = UITabBarItem(title: "Para ti", image: UIImage(systemName: "gift"), tag: 2)
        myaccountVc.tabBarItem = UITabBarItem(title: "Mi cuenta", image: UIImage(systemName: "person.crop.circle"), tag: 3)
        
        viewControllers = [
            homeVc,
            transferVc,
            foryouVC,
            myaccountVc
        ]
        
    }

}
