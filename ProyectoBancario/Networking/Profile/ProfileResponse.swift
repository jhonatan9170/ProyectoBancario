//
//  ProfileResponse.swift
//  ProyectoBancario
//
//  Created by Jhonatan Chavez on 16/08/26.
//

// MARK: - AccountResponse
struct ProfileResponse: Codable {
    let cliente: ClientResponse
}

// MARK: - Cliente
struct ClientResponse: Codable {
    let id: Int
    let dni, nombres, apellidos, fechaNacimiento: String
    let telefono, email, direccion, distrito: String
    let departamento, fechaRegistro: String

    enum CodingKeys: String, CodingKey {
        case id, dni, nombres, apellidos
        case fechaNacimiento = "fecha_nacimiento"
        case telefono, email, direccion, distrito, departamento
        case fechaRegistro = "fecha_registro"
    }
}
