//
//  TakeHomeProjectApp.swift
//  TakeHomeProject
//
//  Created by Eric on 05/08/2023.
//

import SwiftUI

@main
struct TakeHomeProjectApp: App {
    var body: some Scene {
        WindowGroup {
            TabView {
                PeopleView()
                    .tabItem {
                        Symbols.person
                        Text("Home")
                    }
                SettingsView()
                    .tabItem {
                        Symbols.gear
                        Text("Settings")
                    }
            }
        }
    }
}
