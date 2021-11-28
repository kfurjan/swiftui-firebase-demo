//
//  ContentView.swift
//  demo
//
//  Created by Kevin Furjan on 28.11.2021.
//

import SwiftUI

struct ContentView: View {

    @EnvironmentObject var viewModel: LoginViewModel

    var body: some View {
        if viewModel.isUserLoggedIn {
            HomeView()
        } else {
            LoginView()
        }
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
