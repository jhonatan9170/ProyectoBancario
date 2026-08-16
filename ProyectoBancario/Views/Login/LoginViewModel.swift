//
//  LoginViewModel.swift
//  ProyectoBancario
//
//  Created by Jhonatan Chavez on 9/08/26.
//

import Foundation

class LoginViewModel {
    
    private let validator = DocumentValidator()
    
    var savedDocument = UserDefaults.standard.string(forKey: "document") //OPTIONAL

    func validate(document: String) -> DocumentValidatorModel {
        return validator.validate(document: document)
    }
}
