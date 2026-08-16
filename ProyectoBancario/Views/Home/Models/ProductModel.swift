//
//  ProcedureModel.swift
//  Dirigida-T2
//
//  Created by Jhonatan Chavez on 2/08/26.
//

struct ProductModel {
    let id: Int
    let name: String
    let ammount: Double?
    let isActive: Bool
}

extension ProductModel {
    init(product: ProductResponse) {
        id = product.productoID
        name = product.nombre
        ammount = Double(product.saldo ?? "0.00")
        isActive = product.tieneProducto == 1
    }
}
