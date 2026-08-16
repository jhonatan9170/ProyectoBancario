//
//  SecondStepViewModel.swift
//  ProyectoBancario
//
//  Created by Jhonatan Chavez on 11/08/26.
//

import Combine
import Foundation

//USERDEFAULTS : STRING, INT, DOUBLE, DATA

class SecondStepViewModel {
    
    @Published var isSuccess: Bool = false
    
    var document: String = ""
    var password: String = ""
    var name: String {
        let savedName = UserDefaults.standard.string(forKey: "name")
        if let savedName {
            return savedName
        } else {
            return document
        }
    }
    
    func login() async {
        let requestModel = LoginRequestModel(dni: document, password: password)
        let endpoint = Endpoint(path: "/api/auth/login", method: .post, body: requestModel)
        let service = NetworkService(baseURL: "https://appmobile.tech")
        let response = try? await service.request(endpoint: endpoint, responseType: LoginResponseModel.self)
        if let response {
            isSuccess = true
            UserDefaults.standard.set(response.token, forKey: "token")
            UserDefaults.standard.set(response.usuario.dni, forKey: "document")
            UserDefaults.standard.set(response.usuario.nombres, forKey: "name")
        }
    }
    
}
