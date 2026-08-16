//
//  ProceduresResponse.swift
//  Dirigida-T2
//
//  Created by Jhonatan Chavez on 2/08/26.
//

// https://quicktype.io/

struct ProceduresResponse:Codable {
    let id, titleProced, descriptionProcedure, imageProcedure: String
    let date: String
}
