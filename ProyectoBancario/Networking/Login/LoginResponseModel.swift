//
//  LoginResponse.swift
//  ProyectoBancario
//
//  Created by Jhonatan Chavez on 11/08/26.
//

struct LoginResponseModel: Codable {
    let token: String
    let usuario: UserLoginResponse
}

struct UserLoginResponse: Codable {
    let id: Int
    let dni: String
    let nombres: String
    let apellidos: String
}
