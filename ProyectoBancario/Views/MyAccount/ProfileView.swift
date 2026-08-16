//
//  ProfileView.swift
//  ProyectoBancario
//
//  Created by Jhonatan Chavez on 16/08/26.
//

import SwiftUI

struct ProfileView: View {
    @StateObject var viewModel = ProfileViewModel()
    var body: some View {
        VStack(alignment: .center,spacing: 10) {
            Image("avatarLogo")
                .resizable()
            .frame(width: 100,height: 100)
            .padding(.bottom,30)
            HStack {
                Text("Nombre: ")
                    .font(Font.custom("Montserrat-Bold", size: 18))
                Text(viewModel.profile?.nombres ?? "")
                    .font(Font.custom("Montserrat-Mediun", size: 15))
            }

            HStack {
                Text("Apellidos: ")
                    .font(Font.custom("Montserrat-Bold", size: 18))
                Text(viewModel.profile?.apellidos ?? "")
                    .font(Font.custom("Montserrat-Mediun", size: 15))
            }
            HStack {
                Text("Dirección: ")
                    .font(Font.custom("Montserrat-Bold", size: 18))
                Text(viewModel.profile?.direccion ?? "")
                    .font(Font.custom("Montserrat-Mediun", size: 15))
            }
            Spacer()
        }
        .padding(20)
        .task {
            await viewModel.getProfile()
        }
    }
}

#Preview {
    ProfileView()
}
