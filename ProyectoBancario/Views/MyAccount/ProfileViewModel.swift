//
//  ProfileViewModel.swift
//  ProyectoBancario
//
//  Created by Jhonatan Chavez on 16/08/26.
//

import Combine
import Foundation

class ProfileViewModel: ObservableObject {
    
    @Published var user: ProfileModel?
    
    func fetchUser() async {
        let token = UserDefaults.standard.string(forKey: "token") ?? ""
        let headers = ["Authorization": "Bearer " + token]
        let service = NetworkService(baseURL: "https://appmobile.tech/api/")
        let endpoint = Endpoint(path: "cliente/perfil", method: .get, headers: headers)
        let profileResponse = try? await service.request(endpoint: endpoint, responseType: ProfileResponse.self)
        if let profileResponse {
            user = ProfileModel(profile: profileResponse.cliente)
        } else {
            user = ProfileModel(name: "Fulano", lastName: "Doe", email: "m@gmail.com", address: "Av lima")
        }
    }
    
    func closeSesion(){
        
    }
    
}
