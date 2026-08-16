//
//  ProductsResponse.swift
//  ProyectoBancario
//
//  Created by Jhonatan Chavez on 16/08/26.
//

import Foundation

// MARK: - AccountResponse
struct ProductsResponse: Codable {
    let productos: [ProductResponse]
}

// MARK: - ProductResponse
struct ProductResponse: Codable {
    let productoID: Int
    let codigo, nombre, descripcion: String
    let permiteTransferir: Int
    let cuentaID: Int?
    let numeroCuenta: String?
    let saldo: String?
    let moneda, estado: String?
    let tieneProducto: Int

    enum CodingKeys: String, CodingKey {
        case productoID = "producto_id"
        case codigo, nombre, descripcion
        case permiteTransferir = "permite_transferir"
        case cuentaID = "cuenta_id"
        case numeroCuenta = "numero_cuenta"
        case saldo, moneda, estado
        case tieneProducto = "tiene_producto"
    }
}
