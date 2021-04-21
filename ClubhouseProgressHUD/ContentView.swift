//
//  ContentView.swift
//  ClubhouseProgressHUD
//
//  Created by Alex Nagy on 21.04.2021.
//

import SwiftUI

struct ContentView: View {
    
    @EnvironmentObject var service: Service
    
    var body: some View {
        VStack {
            HStack {
                Spacer()
                Button {
                    didTapButton()
                } label: {
                    Text("Fetch data")
                }
                Spacer()
            }
            Spacer()
        }
        .padding()
        .background(Color(red: 241/255, green: 239/255, blue: 229/255).ignoresSafeArea())
    }
    
    func didTapButton() {
        service.showHUD()
        DispatchQueue.main.asyncAfter(deadline: .now() + 5) {
            service.hideHUD()
        }
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
