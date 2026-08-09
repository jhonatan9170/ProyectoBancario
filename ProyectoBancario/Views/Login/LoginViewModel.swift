//
//  LoginViewModel.swift
//  ProyectoBancario
//
//  Created by Jhonatan Chavez on 9/08/26.
//

class LoginViewModel {
    
    private let validator = DocumentValidator()
    
    func validateDocument(_ document: String) -> DocumentValidatorResult {
        return validator.validate(document: document)
    }
    
    
    
}
