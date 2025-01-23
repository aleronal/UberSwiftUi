//
//  UberSwiftUiApp.swift
//  UberSwiftUi
//
//  Created by Alejandro Rodriguez on 03/08/2024.
//

import SwiftUI

@main
struct UberSwiftUiApp: App {
    @StateObject var locationViewModel = LocationSearchViewModel()
    var body: some Scene {
        WindowGroup {
            HomeView()
                .environmentObject(locationViewModel)
        }
    }
}
