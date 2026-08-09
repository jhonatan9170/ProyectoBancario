//
//  Buttons.swift
//  T1-solucion
//
//  Created by Jhonatan Chavez on 1/08/26.
//

import UIKit

class ButtonStyle {
    static func setPrimaryButton(button:UIButton ,text: String){
        button.titleLabel?.font = UIFont(name: "Montserrat-Bold", size: 16)
        button.setTitleColor(.white, for: .normal)
        button.setTitle(text, for: .normal)
        button.backgroundColor = UIColor(named: "blue1")
        button.layer.cornerRadius = 8
        
    }
}
