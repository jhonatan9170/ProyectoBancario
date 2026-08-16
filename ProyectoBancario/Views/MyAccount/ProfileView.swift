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
        VStack(spacing: 15) {
            Image("avatarLogo")
                .resizable()
                .frame(width: 100, height: 100)
                .padding(.top, 20)
            HStack {
                Text("Nombre:")
                    .font(Font.custom("Montserrat-SemiBold", size: 18))
                Text(viewModel.user?.name ?? "")
                    .font(Font.custom("Montserrat-Medium", size: 17))
            }
            HStack {
                Text("Apellido:")
                    .font(Font.custom("Montserrat-SemiBold", size: 18))
                Text(viewModel.user?.lastName ?? "")
                    .font(Font.custom("Montserrat-Medium", size: 17))
            }
            HStack {
                Text("Dirección:")
                    .font(Font.custom("Montserrat-SemiBold", size: 18))
                Text(viewModel.user?.address ?? "")
                    .font(Font.custom("Montserrat-Medium", size: 17))
            }
            HStack {
                Text("Email: ")
                    .font(Font.custom("Montserrat-SemiBold", size: 18))
                Text(viewModel.user?.email ?? "")
                    .font(Font.custom("Montserrat-Medium", size: 17))
            }
            Spacer()
            Button {
                viewModel.closeSesion()
            } label: {
                Text("Cerrar Sesión")
                    .foregroundStyle(.red)
            }
            .padding(.bottom,40)
        
        }
        .onAppear {
            Task {
                await viewModel.fetchUser()
            }
        }
    }
}

#Preview {
    ProfileView()
}
