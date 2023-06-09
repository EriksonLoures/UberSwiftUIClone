//
//  UberSwiftUICloneApp.swift
//  UberSwiftUIClone
//
//  Created by Erik Loures on 27/05/23.
//

import SwiftUI

@main
struct UberSwiftUICloneApp: App {
    @StateObject var locationViewModel = LocationSearchViewModel()
        
    var body: some Scene {
        WindowGroup {
            HomeView()
                .environmentObject(locationViewModel)
        }
    }
}
