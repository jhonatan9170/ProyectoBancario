//
//  LoginUseCase.swift
//  ProyectoBancario
//
//  Created by Jhonatan Chavez on 21/08/26.
//

import Foundation

class LoginUseCase {
    
    func login(document: String, password: String) async -> LoginState {
        let bodyRequest = LoginRequest(dni: document, password: password)
        let service = NetworkService(baseURL: "https://appmobile.tech/api")
        let endpoint = Endpoint(path: "/auth/login", method: .post, body: bodyRequest)
        let response = try? await service.request(endpoint: endpoint, responseType: LoginResponse.self)
        if let response {
            UserDefaults.standard.set(response.usuario.dni, forKey: "dni")
            UserDefaults.standard.set(response.usuario.nombres, forKey: "name")
            UserDefaults.standard.set(response.token, forKey: "token")
            return .success
        } else {
            return .failure
        }
    }
}

enum LoginState {
    case success
    case failure
}
