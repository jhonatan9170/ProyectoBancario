//
//  UIView+Extension.swift
//  ProyectoBancario
//
//  Created by Jhonatan Chavez on 9/08/26.
//

import UIKit

extension UIViewController {
    
    func showAlert(title: String = "Error", message: String) {
        let alert = UIAlertController(
            title: title,
            message: message,
            preferredStyle: .alert
        )
        alert.addAction(UIAlertAction(title: "Aceptar", style: .default))
        self.present(alert, animated: true)
    }
    
}
