//
//  Button+Extension.swift
//  ProyectoBancario
//
//  Created by Jhonatan Chavez on 9/08/26.
//

import UIKit

extension UIButton {
    
    func setPrimaryButton(text: String){
        self.titleLabel?.font = UIFont(name:"Montserrat-Bold" , size: 16)
        self.setTitleColor(.white, for: .normal)
        self.setTitle(text, for: .normal)
        self.backgroundColor = UIColor(named: "blue1")
        self.layer.cornerRadius = 8
    }
    
}
