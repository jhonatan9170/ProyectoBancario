//
//  Document]Validator.swift
//  T1-solucion
//
//  Created by Jhonatan Chavez on 1/08/26.
//

enum DocumentValidatorModel {
    case valid
    case invalid(message: String)
}

struct DocumentValidator {
    
    func validate(document: String) -> DocumentValidatorModel{
        guard document.count == 8 else {
            return .invalid(message: "La contraseña debe tener 8 caráctere")

        }
        let esNumero = document.allSatisfy { $0.isNumber }
        guard esNumero else {
            return .invalid(message: "La contraseña debe contener solo números")
        }
        return .valid
    }
}
