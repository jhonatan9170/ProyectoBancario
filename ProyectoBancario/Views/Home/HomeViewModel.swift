//
//  HomeViewModel.swift
//  ProyectoBancario
//
//  Created by Jhonatan Chavez on 16/08/26.
//

import Combine
import Foundation

class HomeViewModel {
    
    @Published var products: [ProductModel] = []
    
    func fetchProducts() async {
        var productos: [ProductModel] = []
        let token = UserDefaults.standard.string(forKey: "token") ?? ""
        let headers = ["Authorization": "Bearer " + token]
        let service = NetworkService(baseURL: "https://appmobile.tech/api/")
        let endpoint = Endpoint(path: "cliente/productos", method: .get, headers: headers)
        let productsResponse = try? await service.request(endpoint: endpoint, responseType: ProductsResponse.self)
        if let products = productsResponse?.productos {
            for product in products {
                productos.append(ProductModel(product: product))
            }
        }
        self.products = productos
        
    }
    
}
