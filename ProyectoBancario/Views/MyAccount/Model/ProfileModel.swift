//
//  ProfileModel.swift
//  ProyectoBancario
//
//  Created by Jhonatan Chavez on 16/08/26.
//

struct ProfileModel {
    let nombres: String
    let apellidos: String
    let direccion: String
    let fechaRegistro: String
}

extension ProfileModel {
    init(profile: ClientResponse){
        self.nombres = profile.nombres
        self.apellidos =  profile.apellidos
        self.direccion = profile.direccion
        self.fechaRegistro = profile.fechaRegistro
    }
}
