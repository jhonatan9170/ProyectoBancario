//
//  SecondStepViewModel.swift
//  ProyectoBancario
//
//  Created by Jhonatan Chavez on 11/08/26.
//

import Combine

class SecondStepViewModel {
    
    @Published var isSuccess: Bool = false
    
    var document: String = ""
    var password: String = ""
    
    func login() async {
        let requestModel = LoginRequestModel(dni: document, password: password)
        let endpoint = Endpoint(path: "/api/auth/login", method: .post, body: requestModel)
        let service = NetworkService(baseURL: "https://appmobile.tech")
        let response = try? await service.request(endpoint: endpoint, responseType: LoginResponseModel.self)
        isSuccess = response != nil
    }
    
}
