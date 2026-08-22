//
//  SecondStepViewModel.swift
//  ProyectoBancario
//
//  Created by Jhonatan Chavez on 14/08/26.
//
// VIEW <-> ViewModel <-> Model
//  VIEW <-> ViewModel <-> UseCase <-> Model
//UserDefaults : Guardar data: String,Int,Double,Bool,Data.

import Combine
import Foundation

class SecondStepViewModel {
    
    @Published var succes: Bool?
    
    var document: String = ""
    var password: String = ""
    var nombre: String {
        let name = UserDefaults.standard.string(forKey: "name")
        if let name {
            return name
        } else {
            return document
        }
    }
    
    let loginUseCase = LoginUseCase()
    
    func login() async {
        let result = await loginUseCase.login(document: document, password: password)
        switch result {
        case .success:
            succes = true
        case .failure:
            succes = false
        }
    }
}
