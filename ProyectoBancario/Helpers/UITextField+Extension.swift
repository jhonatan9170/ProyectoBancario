//
//  UITextField+Extension.swift
//  ProyectoBancario
//
//  Created by Jhonatan Chavez on 9/08/26.
//

import UIKit

extension UITextField {
    
    func setPrimaryTextField(placeholder: String, keyboarType: UIKeyboardType = .default){
        self.placeholder = placeholder
        self.textColor = UIColor(named: "gray1")
        self.font = UIFont(name:"Montserrat-Bold" , size: 16)
        self.backgroundColor = UIColor(named: "gray2")
        self.layer.cornerRadius = 8
        self.borderStyle = .none
        self.keyboardType = keyboarType

    }
    
}
