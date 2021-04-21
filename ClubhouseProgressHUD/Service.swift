//
//  Service.swift
//  ClubhouseProgressHUD
//
//  Created by Alex Nagy on 21.04.2021.
//

import SwiftUI

class Service: ObservableObject {
    @Published var isHUDActive = false
    
    func showHUD() {
        isHUDActive = true
    }
    
    func hideHUD() {
        isHUDActive = false
    }
}
