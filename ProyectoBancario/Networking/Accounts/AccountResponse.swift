//
//  AccountResponse.swift
//  ProyectoBancario
//
//  Created by Jhonatan Chavez on 16/08/26.
//

// MARK: - AccountResponse
struct AccountResponse: Codable {
    let productos: [ProductResponse]
}

// MARK: - Producto
struct ProductResponse: Codable  {
    let producto_id: Int
    let codigo, nombre, descripcion: String
    let permite_transferir: Int
    let cuenta_id: Int?
    let numero_cuenta: String?
    let saldo: String?
    let moneda, estado: String?
    let tiene_producto: Int
}
