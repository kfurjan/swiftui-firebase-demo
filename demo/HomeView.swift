//
//  HomeView.swift
//  demo
//
//  Created by Kevin Furjan on 28.11.2021.
//

import GoogleSignIn
import SwiftUI
import SDWebImageSwiftUI

struct UserDetailView: View {

    let user: GIDGoogleUser?

    var body: some View {
        VStack {
            HStack {
                Text(user?.profile?.name ?? "")
                    .bold()
                    .font(.title2)

                Spacer()

                WebImage(url: user?.profile?.imageURL(withDimension: 75))
                    .resizable()
                    .placeholder(
                        Image(systemName: "person.fill")
                    )
                    .indicator(.activity)
                    .transition(.fade(duration: 0.5))
                    .frame(width: 75, height: 75, alignment: .center)
                    .scaledToFit()
                    .clipShape(Circle())
            }
            HStack {
                Text(user?.profile?.email ?? "")
                    .bold()
                    .font(.subheadline)
                Spacer()
            }

            Spacer()
        }
        .padding()
        .frame(height: 150, alignment: .center)
        .background(.thickMaterial)
        .cornerRadius(12)
    }
}

struct HomeView: View {

    @EnvironmentObject var viewModel: LoginViewModel
    private let user = GIDSignIn.sharedInstance.currentUser

    var body: some View {
        VStack {
            UserDetailView(user: user)

            Spacer()

            Button(action: {
                withAnimation {
                    viewModel.signOut()
                }
            }) {
                HStack {
                    Text("Sign out")
                        .fontWeight(.bold)
                }
            }
            .foregroundColor(.white)
            .padding()
            .frame(maxWidth: .infinity)
            .background(.black)
            .cornerRadius(12)
            .padding()
        }
        .padding()
    }
}

struct HomeView_Previews: PreviewProvider {
    static var previews: some View {
        HomeView()
    }
}
