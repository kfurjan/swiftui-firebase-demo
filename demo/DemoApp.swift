//
//  demoApp.swift
//  demo
//
//  Created by Kevin Furjan on 28.11.2021.
//

import SwiftUI

@main
struct DemoApp: App {

    @UIApplicationDelegateAdaptor(AppDelegate.self) var appDelegate

    @StateObject var viewModel = LoginViewModel()

    var body: some Scene {
        WindowGroup {
            ContentView()
                .environmentObject(viewModel)
        }
    }
}
