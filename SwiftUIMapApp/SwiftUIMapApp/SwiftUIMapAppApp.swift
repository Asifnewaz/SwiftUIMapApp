//
//  SwiftUIMapAppApp.swift
//  SwiftUIMapApp
//
//  Created by USER on 1/24/24.
//

import SwiftUI

@main
struct SwiftUIMapAppApp: App {
    private var vm = LocationsViewModel()
    var body: some Scene {
        WindowGroup {
            LocationsView()
                .environmentObject(vm)
        }
    }
}
