//
//  ProfileModel.swift
//  ProyectoBancario
//
//  Created by Jhonatan Chavez on 16/08/26.
//

struct ProfileModel {
    let name: String
    let lastName: String
    let email: String
    let address: String
}

extension ProfileModel {
    init(profile: ClientResponse){
        name = profile.nombres
        lastName = profile.apellidos
        email = profile.email
        address =  profile.direccion
    }
}
