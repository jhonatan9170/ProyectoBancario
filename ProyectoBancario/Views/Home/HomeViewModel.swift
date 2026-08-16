//
//  ProceduresViewModel.swift
//  Dirigida-T2
//
//  Created by Jhonatan Chavez on 9/08/26.
//

// suscriptor -> suscriber

import Combine
import Foundation

class HomeViewModel {
    
   @Published var accounts: [ProductModel] = []
    
    func getProcedures() async {
        var accounts: [ProductModel] = []
        let token = UserDefaults.standard.string(forKey: "token") ?? ""
        let header = ["Authorization": "Bearer \(token)"]
        let service = NetworkService(baseURL: "https://appmobile.tech/api")
        let endpoint = Endpoint(path: "/cliente/productos", method: .get,headers: header)
        let productResponse = try! await service.request(endpoint: endpoint, responseType: AccountResponse.self)
        for product in productResponse.productos {
            let account = ProductModel(product: product)
            accounts.append(account)
        }
        self.accounts = accounts
    }
    
}
