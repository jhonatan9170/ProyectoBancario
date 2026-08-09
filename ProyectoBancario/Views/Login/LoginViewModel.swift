//
//  LoginViewModel.swift
//  ProyectoBancario
//
//  Created by Jhonatan Chavez on 9/08/26.
//

class LoginViewModel {
    
    private let validator = DocumentValidator()

    func validate(document: String) -> DocumentValidatorModel {
        return validator.validate(document: document)
    }
}
