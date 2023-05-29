//
//  Realm_Intro_2App.swift
//  Realm Intro-2
//
//  Created by Stewart Lynch on 2022-03-07.
//

import SwiftUI

@main
struct Realm_Intro_2App: App {
    let migrator = Migrator()
    var body: some Scene {
        WindowGroup {
            TabView {
                CountriesListView()
                    .tabItem {
                        Label("Countries", systemImage: "list.dash")
                    }
                AllCitiesListView()
                    .tabItem {
                        Label("Cities", systemImage: "list.dash")
                    }
            }
            .onAppear {
                print(FileManager.default.urls(for: .documentDirectory, in: .userDomainMask).first!.path)
                UserDefaults.standard.setValue(false, forKey: "_UIConstraintBasedLayoutLogUnsatisfiable")
            }
        }
    }
}
