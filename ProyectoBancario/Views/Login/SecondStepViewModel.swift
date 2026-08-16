//
//  SecondStepViewModel.swift
//  ProyectoBancario
//
//  Created by Jhonatan Chavez on 14/08/26.
//

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

    
    func login() async {
        let bodyRequest = LoginRequest(dni: document, password: password)
        let service = NetworkService(baseURL: "https://appmobile.tech/api")
        let endpoint = Endpoint(path: "/auth/login", method: .post, body: bodyRequest)
        let response = try? await service.request(endpoint: endpoint, responseType: LoginResponse.self)
        
        if let response {
            succes = true
            UserDefaults.standard.set(response.usuario.dni, forKey: "dni")
            UserDefaults.standard.set(response.usuario.nombres, forKey: "name")
            UserDefaults.standard.set(response.token, forKey: "token")
        } else {
            succes = false
        }
        
    }
}
