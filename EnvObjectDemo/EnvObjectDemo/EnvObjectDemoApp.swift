//
//  EnvObjectDemoApp.swift
//  EnvObjectDemo
//
//  Created by Subhra Roy on 08/07/21.
//

import SwiftUI

@main
struct EnvObjectDemoApp: App {
    var body: some Scene {
        WindowGroup {
            let userSettings = UserSettings()
            ContentView().environmentObject(userSettings)
        }
    }
}
