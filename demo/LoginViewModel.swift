//
//  LoginViewModel.swift
//  demo
//
//  Created by Kevin Furjan on 28.11.2021.
//

import Firebase
import GoogleSignIn

final class LoginViewModel: ObservableObject {

    @Published var isUserLoggedIn = false

    func signIn() {
        do {
            let config = GIDConfiguration.getGIDConfigurationInstance()
            let uiViewController = try UIApplication.getRootViewController()

            GIDSignIn.sharedInstance.signIn(with: config, presenting: uiViewController) { user, error in
                guard error == nil else { return }
                guard user != nil else { return }
                self.isUserLoggedIn = true
          }
        } catch {
            print(error.localizedDescription)
        }
    }

    func signOut() {
        GIDSignIn.sharedInstance.signOut()
        isUserLoggedIn = false
    }
}
