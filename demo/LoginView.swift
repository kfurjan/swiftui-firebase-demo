//
//  LoginView.swift
//  demo
//
//  Created by Kevin Furjan on 28.11.2021.
//

import SwiftUI

struct LoginView: View {

    @EnvironmentObject var viewModel: LoginViewModel

    var body: some View {
        VStack {
            Spacer()

            Button(action: {
                withAnimation {
                    viewModel.signIn()
                }
            }) {
                HStack {
                    Text("Sign in with google")
                        .fontWeight(.bold)
                }
            }
            .foregroundColor(.white)
            .padding()
            .frame(maxWidth: .infinity)
            .background(.black)
            .cornerRadius(12)
            .padding()

            Spacer()
        }
    }
}

struct LoginView_Previews: PreviewProvider {
    static var previews: some View {
        LoginView()
    }
}
