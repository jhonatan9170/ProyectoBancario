//
//  Document]Validator.swift
//  T1-solucion
//
//  Created by Jhonatan Chavez on 1/08/26.
//

enum DocumentValidatorResult {
    case success
    case failure(message: String)
}

struct DocumentValidator {
    
    func validate(document: String) -> DocumentValidatorResult{
        guard document.count == 8 else {
            return .failure(message: "El campo debe tener 8 carácteres")
        }
        let esNumero = document.allSatisfy { $0.isNumber }
        guard esNumero else {
            return .failure(message: "La contraseña debe contener solo números")

        }
        return .success
    }
}
