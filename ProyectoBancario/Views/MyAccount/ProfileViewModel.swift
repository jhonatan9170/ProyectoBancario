//
//  ProfileViewModel.swift
//  ProyectoBancario
//
//  Created by Jhonatan Chavez on 16/08/26.
//

import Combine
import Foundation

class ProfileViewModel: ObservableObject {
    
    @Published var profile: ProfileModel?
    
    func getProfile() async {
        let token = UserDefaults.standard.string(forKey: "token") ?? ""
        let header = ["Authorization": "Bearer \(token)"]
        let service = NetworkService(baseURL: "https://appmobile.tech/api")
        let endpoint = Endpoint(path: "/cliente/perfil", method: .get,headers: header)
        let profileResponse = try? await service.request(endpoint: endpoint, responseType: ProfileResponse.self)
        if let profileResponse {
            profile = ProfileModel(profile: profileResponse.cliente)
        } else {
            profile = ProfileModel(nombres: "Fulano", apellidos: "Díaz", direccion: "calle 1", fechaRegistro: "22-10-11")
        }
    }
    
}
