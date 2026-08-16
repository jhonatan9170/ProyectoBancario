//
//  LoginResponse.swift
//  ProyectoBancario
//
//  Created by Jhonatan Chavez on 14/08/26.
//

struct LoginResponse: Codable {
    let mensaje: String
    let token: String
    let usuario: UserResponse
}
    
struct UserResponse: Codable {
    let id: Int
    let nombres: String
    let apellidos: String
    let dni: String
}
