//
//  ClubhouseProgressHUDApp.swift
//  ClubhouseProgressHUD
//
//  Created by Alex Nagy on 21.04.2021.
//

import SwiftUI

@main
struct ClubhouseProgressHUDApp: App {
    
    @StateObject private var service = Service()
    
    var body: some Scene {
        WindowGroup {
            ContentView()
                .environmentObject(service)
                .embedInClubhouseHUD(isActive: $service.isHUDActive)
        }
    }
}
