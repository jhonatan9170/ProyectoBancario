//
//  LoginViewModel.swift
//  ProyectoBancario
//
//  Created by Jhonatan Chavez on 9/08/26.
//

import Foundation

class LoginViewModel {
    
    private let validator = DocumentValidator()
    
    var document: String? {
        return UserDefaults.standard.string(forKey: "dni")
    }
    
    func validateDocument(_ document: String) -> DocumentValidatorResult {
        return validator.validate(document: document)
    }
    
    
    
}
