//
//  SecondStepViewModel.swift
//  ProyectoBancario
//
//  Created by Jhonatan Chavez on 14/08/26.
//

import Combine

class SecondStepViewModel {
    
    @Published var succes: Bool?
    
    var document: String = ""
    var password: String = ""
    
    func login() async {
        let bodyRequest = LoginRequest(dni: document, password: password)
        let service = NetworkService(baseURL: "https://appmobile.tech/api")
        let endpoint = Endpoint(path: "/auth/login", method: .post, body: bodyRequest)
        let response = try? await service.request(endpoint: endpoint, responseType: LoginResponse.self)
        
        if let response {
            succes = true
        } else {
            succes = false
        }
        
    }
}
